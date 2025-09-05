import 'package:breach/core/constants/app_assets.dart';
import 'package:breach/core/widgets/category_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../domain/controllers/onboarding_controller.dart';

class InterestsPage extends GetView<OnboardingController> {
  const InterestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Mascot
              Center(child: Image.asset(AppAssets.mascotImage, height: 100.h)),
              SizedBox(height: 24.h),

              // Title
              Text(
                "What are your interests?",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),

              // Subtitle
              Text(
                "Select your interests and I'll recommend some series I'm certain you'll enjoy!",
                style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),

              // Chips
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(() {
                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: controller.categories.map((category) {
                        return CategoryChip(
                          category: category,
                          isSelected: controller.isSelected(category),
                          onTap: () => controller.onCategoryTapped(category),
                        );
                      }).toList(),
                    );
                  }),
                ),
              ),

              SizedBox(height: 20.h),

              // Next button
              Obx(() {
                return AppButton(
                  label: "Next",
                  minimumSize: Size(120.w, 40.h),
                  backgroundColor: controller.selectedCategories.isEmpty
                      ? Colors.grey.shade400
                      : Colors.black,
                  onPressed: controller.goHome,
                );
              }),

              SizedBox(height: 12.h),

              // Skip for later
              GestureDetector(
                onTap: () => Get.offAllNamed("/home"),
                child: Text(
                  "Skip for later",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
