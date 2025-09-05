import 'dart:math' show Random;

import 'package:breach/core/service/websocket_service.dart';
import 'package:breach/core/utils/local_storage.dart';
import 'package:breach/features/auth/domain/controllers/auth_controller.dart';
import 'package:breach/features/home/data/models/category_model.dart';
import 'package:breach/features/home/data/models/interest_model.dart';
import 'package:breach/features/home/data/models/post_model.dart';
import 'package:breach/features/home/data/models/stream_model,dart' as stream;
import 'package:breach/features/home/data/repositories/blog_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  var selectedTab = 0.obs;
  final RxInt selectedBottomNavIndex = 0.obs;

  final repository = BlogRepository();

  var isLoading = false.obs;
  var categories = <CategoryModel>[].obs;
  var posts = <PostModel>[].obs;
  var featuredPosts = <PostModel>[].obs;
  var popularPosts = <PostModel>[].obs;
  var recentPosts = <PostModel>[].obs;

  final wsService = Get.put(WebSocketService());

  RxList<stream.StreamModel> streams = <stream.StreamModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    final token = LocalStorage.getToken();
    debugPrint('Retrieved token:: $token');
    if (token != null) {
      wsService.connect(token);

      // bind the service's stream list to the controller's stream list
      ever(wsService.streams, (_) {
        streams.assignAll(wsService.streams);
      });
    }
    fetchData();
  }

  var tabCategories = <String, Category>{}.obs; // map tab -> category
  //  Map<String, dynamic> arguments = Get.arguments ?? <String, dynamic>{};
  // List<InterestModel>? interests = arguments['interests'];

  Future<void> fetchData() async {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    List<InterestModel>? interests = arguments['interests'];
    isLoading.value = true;
    try {
      if (interests?.isNotEmpty ?? false) {
        // Shuffle user interests
        final random = Random();
        final shuffled = [...?interests]..shuffle(random);

        // Pick 3 categories from interests
        tabCategories["Featured"] = shuffled[0].category ?? Category();
        tabCategories["Popular"] = shuffled[1].category ?? Category();
        tabCategories["Recent"] = shuffled[2].category ?? Category();

        // Fetch posts for each
        featuredPosts.value = await repository.getPostsByCategory(
          shuffled[0].category?.id ?? 0,
        );

        popularPosts.value = await repository.getPostsByCategory(
          shuffled[1].category?.id ?? 0,
        );

        recentPosts.value = await repository.getPostsByCategory(
          shuffled[2].category?.id ?? 0,
        );

        // Sort recent by date
        recentPosts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      } else {
        // Use default category IDs when interests are null or empty
        debugPrint("No interests found, using default categories");

        tabCategories["Featured"] = Category();
        tabCategories["Popular"] = Category();
        tabCategories["Recent"] = Category();

        // Fetch posts using default category IDs
        featuredPosts.value = await repository.getPostsByCategory(1);
        popularPosts.value = await repository.getPostsByCategory(2);
        recentPosts.value = await repository.getPostsByCategory(3);

        // Sort recent by date
        recentPosts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void onCategoryTapped(CategoryModel category) {
    debugPrint("Selected category: ${category.name}");
  }

  void onBottomNavTapped(int index) {
    selectedBottomNavIndex.value = index;
  }

  @override
  void onClose() {
    tabController.dispose();
    wsService.disconnect();
    super.onClose();
  }
}
