import 'package:breach/core/constants/app_assets.dart';
import 'package:breach/core/constants/app_colors.dart';
import 'package:breach/features/home/presentation/guest_page.dart';
import 'package:breach/features/home/presentation/side_menu_drawer.dart';
import 'package:breach/features/home/widgets/custom_tab_indicator.dart';
import 'package:breach/features/home/widgets/sliver_tab_deligate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../domain/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenuDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xffFCFAFF),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: AppColors.textPrimary,
                          size: 24.sp,
                        ),
                        tooltip: "Menu",
                        splashRadius: 24.r,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Image.asset(
                      AppAssets.breachLogo,
                      width: 114.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: DefaultTabController(
                length: 3,
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          // Hero Section as a sliver header
                          SliverToBoxAdapter(
                            child: Container(
                              color: Color(0xffFCFAFF),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5.h),
                                  Text(
                                    "Top Picks",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    "Experience the best of Breach",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  Image.asset(AppAssets.breachAd),
                                  SizedBox(height: 15.h),
                                  Text(
                                    "How to success in long-term Investment",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "I recently started contemplating how to apply my carefree mentality to my financial planning. I've mainly been considering looking at my crypto wallets whenever I feel ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ),

                          // Tab Bar as a pinned sliver header
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: SliverTabBarDelegate(
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
                            ),
                          ),
                        ];
                      },

                  // Tab content
                  body: TabBarView(
                    controller: controller.tabController,
                    children: [
                      // Featured Tab
                      ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 150.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    color: Colors.amber[100],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16.r),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Work in progress",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.grey600,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        "On migration and maintaining friendships",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        "I went to boarding school and left pretty early, so I had some experience with losing friends to relocation long before the",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.grey600,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        children: [
                                          Text(
                                            "Lota Anidi",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: AppColors.grey900,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(4.sp),
                                            height: 4.h,
                                            width: 4,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.dark,
                                            ),
                                          ),
                                          Text(
                                            "12 Dec 2022",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: AppColors.grey900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (i, o) => SizedBox(height: 20.h),
                        itemCount: 10,
                      ),

                      // Popular Tab
                      ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Popular Content ${index + 1}",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "This is popular content that users are engaging with most...",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.grey600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (i, o) => SizedBox(height: 16.h),
                        itemCount: 8,
                      ),

                      // Recent Tab
                      ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Recent Post ${index + 1}",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "This is the most recent content published on the platform...",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.grey600,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "Just now",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.grey900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (i, o) => SizedBox(height: 16.h),
                        itemCount: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom delegate for the tab bar header
