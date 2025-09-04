import 'package:breach/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController  with GetTickerProviderStateMixin {
  late TabController tabController;
  var selectedTab = 0.obs;
  final RxInt selectedBottomNavIndex = 0.obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    loadCategories();
  }

  void loadCategories() {
    categories.value = [
      CategoryModel(name: "Humor", icon: "😂", id: 1),
      CategoryModel(name: "Lifehacks", icon: "💡", id: 1),
      CategoryModel(name: "Crypto", icon: "🪙", id: 1),
      CategoryModel(name: "Art", icon: "🖌️", id: 1),
      CategoryModel(name: "Travel", icon: "✈️", id: 1),
      CategoryModel(name: "Sports", icon: "🏀", id: 1),
      CategoryModel(name: "Photography", icon: "📷", id: 1),
      CategoryModel(name: "Food and drink", icon: "🍔", id: 1),
      CategoryModel(name: "History", icon: "🏛️", id: 1),
      CategoryModel(name: "Science", icon: "🧪", id: 1),
      CategoryModel(name: "News", icon: "📰", id: 1),
      CategoryModel(name: "Business", icon: "📈", id: 1),
      CategoryModel(name: "Music", icon: "🎵", id: 1),
      CategoryModel(name: "Tech", icon: "📱", id: 1),
      CategoryModel(name: "Faith & Spirituality", icon: "🙏", id: 1),
      CategoryModel(name: "Nature", icon: "🌿", id: 1),
    ];
  }

  void onCategoryTapped(CategoryModel category) {
    print("Selected category: ${category.name}");
  }

  void onBottomNavTapped(int index) {
    selectedBottomNavIndex.value = index;
  }

  @override
  void onClose() {
    // tabController.dispose();
    super.onClose();
  }

}

