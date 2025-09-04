import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final double borderRadius;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? textColor;
  final Size? minimumSize;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
    this.borderRadius = 8.0,
    this.padding,
    this.backgroundColor,
    this.textColor,
    this.minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize ?? Size(double.infinity, 48.h),
        backgroundColor: isEnabled
            ? (backgroundColor ?? AppColors.primary)
            : AppColors.greyLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      ),
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: isEnabled
              ? (textColor ?? AppColors.background)
              : AppColors.grey,
        ),
      ),
    );
  }
}
