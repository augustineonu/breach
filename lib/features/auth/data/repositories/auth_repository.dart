import 'package:breach/core/constants/api_endpoints.dart';
import 'package:breach/core/network/api_service.dart';
import 'package:breach/features/auth/data/models/auth_response_model.dart';


class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<AuthResponseModel> register(String email, String password) async {
    final response = await apiService.post(ApiEndpoints.register, {
      "email": email,
      "password": password,
    });
    return AuthResponseModel.fromJson(response);
  }

  Future<AuthResponseModel> login(String email, String password) async {
    final response = await apiService.post(ApiEndpoints.login, {
      "email": email,
      "password": password,
    });
    return AuthResponseModel.fromJson(response);
  }
}
