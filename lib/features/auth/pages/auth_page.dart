import 'package:breach/core/constants/app_assets.dart';
import 'package:breach/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../domain/controllers/auth_controller.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 24.h),
                      Image.asset(
                        AppAssets.breachLogo,
                        width: 100.w,
                        height: 100.h,
                      ),

                      // Title
                      Text(
                        controller.isLogin.value
                            ? "Log in to Breach"
                            : "Join Breach",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      // Subtitle
                      Text(
                        controller.isLogin.value
                            ? "Access your account and discover content that matters to you."
                            : "Break through the noise and discover content that matters to you in under 3 minutes.",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      SizedBox(height: 32.h),

                      // Email field
                      Obx(
                        () => TextField(
                          controller: controller.emailController,
                          onChanged: (val) => controller.email.value = val,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            errorText: controller.email.value.isEmpty
                                ? null
                                : (controller.isEmailValid
                                      ? null
                                      : "Enter a valid email"),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Password field
                      TextField(
                        controller: controller.passwordController,
                        obscureText: !controller.isVisible.value,
                        onChanged: (val) => controller.password.value = val,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: controller.isVisible.toggle,
                            icon: Icon(
                              controller.isVisible.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                          labelText: "Password",
                          hintText: "Enter password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),

                      SizedBox(height: 84.h),

                      // Continue button
                      AppButton(
                        label: "Continue",
                        isLoading: controller.isLoading.value,
                        isEnabled: controller.isFormValid,
                        onPressed: controller.authenticate,
                      ),

                      SizedBox(height: 16.h),

                      // RichText: toggle login / signup
                      Center(
                        child: Obx(
                          () => RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textSecondary,
                              ),
                              children: [
                                TextSpan(
                                  text: controller.isLogin.value
                                      ? "Don't have an account? "
                                      : "Already have an account? ",
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: GestureDetector(
                                    onTap: controller.toggleAuthMode,
                                    child: Text(
                                      controller.isLogin.value
                                          ? "Sign up"
                                          : "Log in",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Obx(
              () => Visibility(
                visible: !controller.isLogin.value,
                child: Row(
                  children: [
                    Flexible(
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textSecondary,
                            ),
                            children: [
                              TextSpan(
                                text: "By signing up, you agree to Breach's ",
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: GestureDetector(
                                  // onTap: controller.toggleAuthMode,
                                  child: Text(
                                    "Terms",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.primary,
                                      decorationThickness: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: GestureDetector(
                                  // onTap: controller.toggleAuthMode,
                                  child: Text(
                                    " & ",
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: GestureDetector(
                                  // onTap: controller.toggleAuthMode,
                                  child: Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.primary,
                                      decorationThickness: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
