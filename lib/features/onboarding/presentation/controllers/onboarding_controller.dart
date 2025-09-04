import 'package:breach/features/home/data/models/category_model.dart';
import 'package:breach/routes/app_routes.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var categories = <CategoryModel>[].obs; // your dummy data
  var selectedCategories = <String>[].obs; // store selected category names/ids

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  void goHome() {
    Get.toNamed
    (AppRoutes.home);
  }

  void onCategoryTapped(CategoryModel category) {
    if (selectedCategories.contains(category.name)) {
      selectedCategories.remove(category.name);
    } else {
      selectedCategories.add(category.name);
    }
  }

  bool isSelected(CategoryModel category) {
    return selectedCategories.contains(category.name);
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
}
