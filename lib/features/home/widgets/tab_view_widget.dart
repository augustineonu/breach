import 'package:breach/core/widgets/blog_card.dart' show BlogCard;
import 'package:breach/core/widgets/blog_card_skeleton.dart';
import 'package:breach/features/home/domain/controllers/guest_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Reusable Post List Tab Widget
class PostListTab extends StatefulWidget {
  final List<dynamic> posts;
  final Function(dynamic)? onPostTap;
  final bool isLoading;

  const PostListTab({
    super.key,
    required this.posts,
    this.onPostTap,
    this.isLoading = false,
  });

  @override
  State<PostListTab> createState() => _PostListTabState();
}

class _PostListTabState extends State<PostListTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Show shimmer when loading
    if (widget.isLoading) {
      return PostListTabSkeleton();
    }

    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        final post = widget.posts[index];
        return BlogCard(
          post: post,
          onTap: widget.onPostTap != null
              ? () => widget.onPostTap!(post)
              : null,
        );
      },
      separatorBuilder: (i, o) => SizedBox(height: 20.h),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// Simplified Tab View Widget
class TabViewWidget extends StatelessWidget {
  const TabViewWidget({super.key, required this.controller});

  final GuestController controller;

  void _onPostTap(dynamic post) {
    debugPrint('Post tapped: ${post.title}');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ConstrainedBox(
        constraints: BoxConstraints(minHeight: 200.h, maxHeight: 300.h),
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.tabController,
          children: [
            PostListTab(
              posts: controller.featuredPosts,
              onPostTap: _onPostTap,
              isLoading: controller.isLoading.value,
            ),
            PostListTab(
              posts: controller.popularPosts,
              onPostTap: _onPostTap,
              isLoading: controller.isLoading.value,
            ),
            PostListTab(
              posts: controller.recentPosts,
              onPostTap: _onPostTap,
              isLoading: controller.isLoading.value,
            ),
          ],
        ),
      );
    });
  }
}
