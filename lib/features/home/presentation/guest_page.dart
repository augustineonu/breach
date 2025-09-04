import 'package:breach/core/constants/app_assets.dart';
import 'package:breach/core/constants/app_colors.dart';
import 'package:breach/core/utils/app_utils.dart';
import 'package:breach/core/widgets/app_button.dart';
import 'package:breach/core/widgets/cache_image.dart';
import 'package:breach/core/widgets/category_chip.dart';
import 'package:breach/features/home/domain/controllers/guest_controller.dart';
import 'package:breach/features/home/widgets/custom_tab_indicator.dart';
import 'package:breach/features/home/widgets/tab_view_widget.dart';
import 'package:breach/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../domain/controllers/home_controller.dart';

class GuestPage extends GetView<GuestController> {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xffFCFAFF),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.breachLogo, width: 114.w, height: 24.h),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.auth);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "Join Breach",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // SCROLLABLE CONTENT
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Hero Section
                    Container(
                      color: Color(0xffFCFAFF),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Find, ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Great',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryLight,
                                            ),
                                          ),
                                          TextSpan(text: '\nIdeas'),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      "Subscribe to your favourite creators and thinkers.\nSupport work that matters.",
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    SizedBox(height: 40.h),

                                    AppButton(
                                      label: "Join Breach",
                                      onPressed: () {
                                        // handle action
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/googles.gif',
                                height: 150.0,
                                width: 150.0,
                              ),
                            ],
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),

                    // Tab Section
                    DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          // Tab Bar
                          TabBar(
                            controller: controller.tabController,
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            indicator: CustomTabIndicator(),
                            dividerColor: Colors.grey[300],
                            dividerHeight: 1.0,
                            labelColor: AppColors.textPrimary,
                            unselectedLabelColor: AppColors.dark.withValues(
                              alpha: 0.6,
                            ),
                            labelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            unselectedLabelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            tabs: [
                              Tab(text: 'Featured'),
                              Tab(text: "Popular"),
                              Tab(text: "Recent"),
                            ],
                          ),

                          // Tab Content with Fixed Height
                          TabViewWIdget(controller: controller),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // Your additional widget here
                          SizedBox(
                            // height: 200.h,
                            width: double.infinity,
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[100],
                            //   borderRadius: BorderRadius.circular(16.r),
                            // ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Discover content from topics you care about",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Obx(() {
                                  return Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: controller.categories
                                        .take(10)
                                        .map((category) {
                                          return CategoryChip(
                                            category: category,
                                            onTap: () {},
                                          );
                                        })
                                        .toList(),
                                  );
                                }),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),

                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
