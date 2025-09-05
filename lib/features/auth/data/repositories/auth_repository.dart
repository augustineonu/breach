import 'package:breach/core/network/api_service.dart';
import 'package:breach/features/auth/data/models/auth_response_model.dart';
import 'package:breach/features/home/data/models/interest_model.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<AuthResponseModel> login(String email, String password) async {
    final response = await apiService.post(
      "auth/login",
      body: {"email": email, "password": password},
    );
    debugPrint("login:: ${response.toString()}");
    return AuthResponseModel.fromJson(response);
  }

  Future<AuthResponseModel> register(String email, String password) async {
    final response = await apiService.post(
      "auth/register",
      body: {"email": email, "password": password},
    );
    debugPrint("register:: ${response.toString()}");

    return AuthResponseModel.fromJson(response);
  }

  Future<List<InterestModel>> getUserInterests({
    required String token,
    required String id,
  }) async {
    final response = await apiService.get(
      "users/$id/interests",
      headers: {"Authorization": "Bearer $token"},
    );
    debugPrint("getUserInterests:: ${response.toString()}");
    return (response as List)
        .map((json) => InterestModel.fromJson(json))
        .toList();
  }
}
