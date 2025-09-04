import 'package:breach/features/home/data/models/category_model.dart';
import 'package:breach/features/home/data/models/post_model.dart';
import 'package:breach/features/home/data/repositories/blog_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math';

class GuestController extends GetxController  with GetTickerProviderStateMixin {
  final BlogRepository repository = BlogRepository();
    late TabController tabController;

  var categories = <CategoryModel>[].obs;
  var featuredPosts = <PostModel>[].obs;
  var popularPosts = <PostModel>[].obs;
  var recentPosts = <PostModel>[].obs;

  var tabCategories = <String, CategoryModel>{}.obs; // map tab -> category
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
     tabController = TabController(length: 3, vsync: this);
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      categories.value = await repository.getCategories();

      if (categories.isNotEmpty) {
        // pick 3 random categories for Featured, Popular, Recent
        final random = Random();
        final shuffled = [...categories]..shuffle(random);

        tabCategories["Featured"] = shuffled[0];
        tabCategories["Popular"] = shuffled[1];
        tabCategories["Recent"] = shuffled[2];

        // load posts for those categories
        featuredPosts.value =
            await repository.getPostsByCategory(shuffled[0].id);

        popularPosts.value =
            await repository.getPostsByCategory(shuffled[1].id);

        recentPosts.value =
            await repository.getPostsByCategory(shuffled[2].id);
        recentPosts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }
    } finally {
      isLoading.value = false;
    }
  }

    @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

