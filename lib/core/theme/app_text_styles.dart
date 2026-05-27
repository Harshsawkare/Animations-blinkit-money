import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography definitions — keeps font sizes, weights, and colors in one place.
class AppTextStyles {
  AppTextStyles._();

  static const TextStyle brandName = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );

  static const TextStyle brandTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 48,
    fontWeight: FontWeight.w900,
    letterSpacing: 2.0,
    height: 1.0,
  );

  static const TextStyle featureTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle featureDescription = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static const TextStyle addMoneyButton = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
  );

  static const TextStyle claimTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle claimSubtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle watermark = TextStyle(
    color: AppColors.textWatermark,
    fontSize: 36,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.0,
    height: 1.2,
  );
}
