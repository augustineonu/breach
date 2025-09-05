import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final bool isLoading;
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
    this.isLoading = false,
    this.borderRadius = 8.0,
    this.padding,
    this.backgroundColor,
    this.textColor,
    this.minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    // Button is disabled if either isEnabled is false OR isLoading is true
    final bool buttonEnabled = isEnabled && !isLoading;
    
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize ?? Size(double.infinity, 48.h),
        backgroundColor: buttonEnabled
            ? (backgroundColor ?? AppColors.primary)
            : AppColors.greyLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      ),
      onPressed: buttonEnabled ? onPressed : null,
      child: isLoading
          ? SizedBox(
              height: 20.h,
              width: 20.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  textColor ?? AppColors.background,
                ),
              ),
            )
          : Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: buttonEnabled
                    ? (textColor ?? AppColors.background)
                    : AppColors.grey,
              ),
            ),
    );
  }
}
