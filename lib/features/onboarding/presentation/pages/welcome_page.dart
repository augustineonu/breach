import 'package:breach/core/constants/app_assets.dart';
import 'package:breach/core/widgets/app_button.dart';
import 'package:breach/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Positioned.fill(child: Image.asset(AppAssets.welcomeSplash)),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.breachLogo,
                      // height: 200.h,
                      width: 150.w,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.messageBubble,
                        height: 200.h,
                        width: 150.w,
                      ),
                      Expanded(
                        child: Image.asset(
                          AppAssets.catoonImage,
                          height: 250.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 74.h),

                  // Title
                  Text(
                    "Welcome to Breach 🥳",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),

                  // Subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      "Just a few quick questions to help personalise your Breach experience. Are you ready?",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  AppButton(
                    minimumSize: Size(100.w, 40.h),
                    label: "Let's begin!",
                    onPressed: () {
                      Get.toNamed(AppRoutes.interests);
                    },
                    backgroundColor: Colors.black, // override to match design
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
