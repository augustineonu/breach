import 'dart:convert';
import 'package:breach/core/constants/api_endpoints.dart';
import 'package:breach/core/network/api_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = ApiEndpoints.baseUrl;

  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    debugPrint("POST $endpoint => ${response.statusCode} | ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      try {
        final Map<String, dynamic> errorJson = json.decode(response.body);

        // Try to extract message
        String errorMessage = "Something went wrong";

        if (errorJson.containsKey('message')) {
          errorMessage = errorJson['message'].toString();
        } else if (errorJson.containsKey('error')) {
          errorMessage = errorJson['error'].toString();
        }

        throw ApiException(errorMessage, statusCode: response.statusCode);
      } catch (e) {
        // If it's already our exception, just throw it
        if (e is ApiException) {
          rethrow;
        }

        // If JSON parsing fails completely
        throw ApiException(
          "Server error: ${response.body}",
          statusCode: response.statusCode,
        );
      }
    }
  }

  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? {'Content-Type': 'application/json'},
    );

    debugPrint("GET $baseUrl$endpoint");
    debugPrint("Response [${response.statusCode}]: ${response.body}");

    if (response.statusCode == 200) {
      return json.decode(response.body); // can be List or Map
    } else {
      // Handle error responses consistently with POST method
      try {
        final dynamic errorJson = json.decode(response.body);

        String errorMessage = "Something went wrong";

        // Handle both Map and other structures
        if (errorJson is Map<String, dynamic>) {
          if (errorJson.containsKey('message')) {
            errorMessage = errorJson['message'].toString();
          } else if (errorJson.containsKey('error')) {
            errorMessage = errorJson['error'].toString();
          }
        } else {
          // If it's not a Map, convert to string
          errorMessage = errorJson.toString();
        }

        throw ApiException(errorMessage, statusCode: response.statusCode);
      } catch (e) {
        // If it's already our exception, just throw it
        if (e is ApiException) {
          rethrow;
        }

        // If JSON parsing fails completely
        throw ApiException(
          "Server error: ${response.body}",
          statusCode: response.statusCode,
        );
      }
    }
  }
}
