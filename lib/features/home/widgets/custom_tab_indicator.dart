import 'package:breach/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter();
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;

    final double indicatorWidth = rect.width * 0.7;

    final Paint paint = Paint()
      ..color = AppColors.dark
      ..style = PaintingStyle.fill;

    final Rect indicatorRect = Rect.fromLTWH(
      rect.left + (rect.width - indicatorWidth) / 2,
      rect.bottom - 2.0,
      indicatorWidth,
      2.0,
    );

    canvas.drawRect(indicatorRect, paint);
  }
}
