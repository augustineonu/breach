import 'package:breach/core/network/api_service.dart';

class InterestRepository {
  final apiService = ApiService();

  Future<void> saveUserInterests({
    required String token,required List<int> categoryIds, required String id
  }) async {
    await apiService.post(
      "users/$id/interests",
      headers: {"Authorization": "Bearer $token"},
      body: {"interests": categoryIds},
    );
  }
}
