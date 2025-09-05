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
  final String tabName;
  final List<dynamic>? fallbackPosts; // Backup posts from other categories

  const PostListTab({
    super.key,
    required this.posts,
    this.onPostTap,
    this.isLoading = false,
    this.tabName = "",
    this.fallbackPosts,
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

    // Determine which posts to show
    List<dynamic> postsToShow = widget.posts;
    bool showingFallback = false;

    if (widget.posts.isEmpty && widget.fallbackPosts?.isNotEmpty == true) {
      postsToShow = widget.fallbackPosts!.take(3).toList(); // Show max 3 fallback posts
      showingFallback = true;
    }

    // Show empty state if no posts and no fallback
    if (postsToShow.isEmpty) {
      return _buildEmptyState();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showingFallback) _buildFallbackHeader(),
        Expanded(
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: postsToShow.length,
            itemBuilder: (context, index) {
              final post = postsToShow[index];
              return BlogCard(
                post: post,
                onTap: widget.onPostTap != null
                    ? () => widget.onPostTap!(post)
                    : null,
              );
            },
            separatorBuilder: (i, o) => SizedBox(height: 20.h),
          ),
        ),
      ],
    );
  }

  Widget _buildFallbackHeader() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.blue.shade200, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.blue.shade600,
            size: 20.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              "No ${widget.tabName.toLowerCase()} posts yet. Here are some suggestions:",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.blue.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    Map<String, Map<String, String>> emptyStateData = {
      'Featured': {
        'icon': '⭐',
        'title': 'No featured posts yet',
        'subtitle': 'Check back soon for handpicked content!'
      },
      'Popular': {
        'icon': '🔥',
        'title': 'Nothing trending right now',
        'subtitle': 'Be the first to discover amazing posts'
      },
      'Recent': {
        'icon': '📰',
        'title': 'No recent posts',
        'subtitle': 'New content will appear here'
      },
    };

    final data = emptyStateData[widget.tabName] ?? {
      'icon': '📝',
      'title': 'No posts available',
      'subtitle': 'Content will appear here soon'
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                data['icon']!,
                style: TextStyle(fontSize: 32.sp),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            data['title']!,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            data['subtitle']!,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
