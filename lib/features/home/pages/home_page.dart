import 'package:breach/core/constants/app_assets.dart';
import 'package:breach/core/constants/app_colors.dart';
import 'package:breach/features/home/pages/side_menu_drawer.dart';
import 'package:breach/features/home/widgets/custom_tab_indicator.dart';
import 'package:breach/features/home/widgets/sliver_tab_deligate.dart';
import 'package:breach/features/home/widgets/stream_card.dart';
import 'package:breach/features/home/widgets/tab_view_widget.dart';
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
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                      SliverToBoxAdapter(
                        child: // Replace the hero card with:
                        Column(
                          children: [
                            // Streams Section
                            SizedBox(
                              height: 260.sp,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Streams",
                                          style: context.textTheme.headlineSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          "Discover trending content from topics you care about in real time",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.textSecondary,
                                          ),
                                        ),

                                        // Divider
                                        Container(
                                          height: 1,
                                          margin: EdgeInsets.symmetric(
                                            vertical: 15.h,
                                          ),
                                          color: Colors.grey[300],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Obx(() {
                                      if (controller.streams.isEmpty) {
                                        return const Center(
                                          child: Text(
                                            "Nothing here yet, but that's about to change!",
                                          ),
                                        );
                                      }

                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                        ),
                                        itemCount: controller.streams
                                            .take(5)
                                            .length,
                                        itemBuilder: (context, index) {
                                          final stream =
                                              controller.streams[index];
                                          return StreamCard(stream: stream);
                                        },
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 20.h),

                            SizedBox(height: 20.h),
                          ],
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
                  body: Obx(() {
                    return TabBarView(
                      controller: controller.tabController,
                      children: [
                        // Featured Tab
                        PostListTab(
                          posts: controller.featuredPosts,
                          onPostTap: (_) {},
                          isLoading: controller.isLoading.value,
                        ),

                        // Popular Tab
                        PostListTab(
                          posts: controller.popularPosts,
                          onPostTap: (_) {},
                          isLoading: controller.isLoading.value,
                        ),

                        // Recent Tab
                        PostListTab(
                          posts: controller.recentPosts,
                          onPostTap: (_) {},
                          isLoading: controller.isLoading.value,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
