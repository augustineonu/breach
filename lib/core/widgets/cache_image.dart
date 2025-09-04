import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double borderRadius;

  const AppCachedImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height ?? 180.sp,
        width: width ?? 150.sp,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          height: height ?? 180.sp,
          width: width ?? 150.sp,
          color: Colors.grey[300],
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Container(
          height: height ?? 180.sp,
          width: width ?? 150.sp,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, color: Colors.red),
        ),
      ),
    );
  }
}
