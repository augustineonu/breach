import 'package:breach/core/constants/app_colors.dart';
import 'package:breach/core/utils/app_utils.dart';
import 'package:breach/core/widgets/cache_image.dart';
import 'package:breach/features/home/domain/controllers/guest_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabViewWIdget extends StatelessWidget {
  const TabViewWIdget({super.key, required this.controller});

  final GuestController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 200.h,
          maxHeight: 300.h,
        ), // Set a fixed height for tab content
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.tabController,
          children: [
            // Featured Tab
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: controller.featuredPosts.length,
              itemBuilder: (context, index) {
                var featured = controller.featuredPosts[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppCachedImage(
                        imageUrl: featured.imageUrl,
                        height: 180.sp,
                        width: 150.sp,
                        borderRadius: 16,
                      ),

                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              featured.title,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              featured.content,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.grey600,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Text(
                                  featured.author.name,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey900,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 6.sp),
                                  height: 4.h,
                                  width: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.dark,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              AppDateUtils.format(featured.createdAt),
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.grey900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (i, o) => SizedBox(height: 20.h),
            ),

            // Popular Tab
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: controller.popularPosts.length,
              itemBuilder: (context, index) {
                var featured = controller.popularPosts[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppCachedImage(
                        imageUrl: featured.imageUrl,
                        height: 180.sp,
                        width: 150.sp,
                        borderRadius: 16,
                      ),

                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              featured.title,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              featured.content,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.grey600,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Text(
                                  featured.author.name,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey900,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 6.sp),
                                  height: 4.h,
                                  width: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.dark,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              AppDateUtils.format(featured.createdAt),
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.grey900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (i, o) => SizedBox(height: 20.h),
            ),

            // Recent Tab
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: controller.recentPosts.length,
              itemBuilder: (context, index) {
                var featured = controller.recentPosts[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppCachedImage(
                        imageUrl: featured.imageUrl,
                        height: 180.sp,
                        width: 150.sp,
                        borderRadius: 16,
                      ),

                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              featured.title,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              featured.content,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.grey600,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Text(
                                  featured.author.name,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey900,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 6.sp),
                                  height: 4.h,
                                  width: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.dark,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              AppDateUtils.format(featured.createdAt),
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.grey900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (i, o) => SizedBox(height: 20.h),
            ),
          ],
        ),
      );
    });
  }
}
