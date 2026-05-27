import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';

/// Paints the subtle repeating dot grid
class BackgroundDotsPainter extends CustomPainter {
  const BackgroundDotsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.walletGold.withAlpha(
        (255 * AppConstants.dotOpacity).round(),
      )
      ..style = PaintingStyle.fill;

    final spacing = AppConstants.dotSpacing;
    final radius = AppConstants.dotRadius;

    // Draw a uniform grid of small dots across the entire canvas.
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  // Dots never change at runtime, so repainting is never needed.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
