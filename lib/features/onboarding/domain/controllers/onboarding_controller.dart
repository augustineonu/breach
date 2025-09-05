import 'package:breach/core/utils/app_snackbar.dart';
import 'package:breach/features/home/data/models/category_model.dart';
import 'package:breach/features/home/domain/controllers/guest_controller.dart';
import 'package:breach/features/onboarding/domain/repositories/interest_repository.dart';
import 'package:breach/routes/app_routes.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedCategories = <CategoryModel>[].obs;
  final guestController = Get.put(GuestController());

  List<CategoryModel> get categories => guestController.categories;

  final repository = InterestRepository();

  @override
  void onInit() {
    super.onInit();

  }

  void goHome() {
    Get.toNamed(AppRoutes.home);
  }

  void onCategoryTapped(CategoryModel category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }

  bool isSelected(CategoryModel category) {
    return selectedCategories.contains(category);
  }

  RxBool isLoading = false.obs;
  Future<void> saveInterests() async {
    if (selectedCategories.isEmpty) {
      AppSnackbar.error("Please select at least one interest");
      return;
    }

    try {
      isLoading.value = true;
      final token = Get.arguments["token"];
      final userId = Get.arguments["userId"];

      await repository.saveUserInterests(
        id: userId,
       token:  token,
       categoryIds:  selectedCategories.map((c) => c.id).toList(),
      );

      AppSnackbar.success("Interests saved!");
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      AppSnackbar.error("Failed to save interests: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
