import 'package:breach/core/constants/api_endpoints.dart';
import 'package:breach/core/network/api_service.dart';
import '../models/category_model.dart';
import '../models/post_model.dart';

class BlogRepository {
  final ApiService apiService = ApiService();



  Future<List<CategoryModel>> getCategories() async {
    final response = await apiService.get(ApiEndpoints.blogCategories);
    return (response as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }

  Future<List<PostModel>> getPostsByCategory(int categoryId) async {
    final response = await apiService
        .get("${ApiEndpoints.blogPosts}?categoryId=$categoryId");
    return (response as List)
        .map((json) => PostModel.fromJson(json))
        .toList();
  }
}
