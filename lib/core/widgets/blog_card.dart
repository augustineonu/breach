import 'package:breach/core/constants/app_colors.dart';
import 'package:breach/core/utils/app_utils.dart';
import 'package:breach/core/widgets/cache_image.dart';
import 'package:breach/features/home/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogCard extends StatelessWidget {
  final PostModel post;
  final VoidCallback? onTap;

  const BlogCard({super.key, required this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCachedImage(
              imageUrl: post.imageUrl,
              height: 120.sp,
              width: 120.sp,
              borderRadius: 12,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.textSecondary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      post.category.name,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),

                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),

                  Text(
                    post.content,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.grey600,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),

                  // Author and date row
                  Row(
                    children: [
                      Flexible(
                        // Add this wrapper
                        child: Text(
                          post.author.name,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                          overflow: TextOverflow.ellipsis, // Add this
                          maxLines: 1, // Add this
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        height: 3.h,
                        width: 3.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grey600,
                        ),
                      ),
                      Text(
                        AppDateUtils.format(post.createdAt),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.grey600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
