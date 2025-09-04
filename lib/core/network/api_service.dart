import 'dart:convert';
import 'package:breach/core/constants/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = ApiEndpoints.baseUrl;

  // ApiService({required this.baseUrl});

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? {'Content-Type': 'application/json'},
    );

    debugPrint("➡️ GET $baseUrl$endpoint");
    debugPrint("⬅️ Response [${response.statusCode}]: ${response.body}");

    if (response.statusCode == 200) {
      return json.decode(response.body); // can be List or Map
    } else {
      throw Exception(response.body);
    }
  }
}
