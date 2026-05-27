import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/wallet_feature_entity.dart';
import '../../domain/entities/wallet_feature_type.dart';

class FeatureCardWidget extends StatelessWidget {
  const FeatureCardWidget({super.key, required this.feature});

  final WalletFeatureEntity feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
      ),
      child: Row(
        children: [
          // ── Icon illustration ─────────────────────────────────────────────
          Container(
            width: AppConstants.featureCardIconSize,
            height: AppConstants.featureCardIconSize,
            decoration: BoxDecoration(
              color: AppColors.iconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                _imageAssetFor(feature.type),
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: AppConstants.spacingM),

          // ── Text section ──────────────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(feature.title, style: AppTextStyles.featureTitle),
                const SizedBox(height: AppConstants.spacingXS),
                Text(feature.description, style: AppTextStyles.featureDescription),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _imageAssetFor(WalletFeatureType type) {
    switch (type) {
      case WalletFeatureType.singleTapPayment:
        return AppConstants.singleTapPaymentAsset;
      case WalletFeatureType.zeroFailures:
        return AppConstants.zeroFailuresAsset;
      case WalletFeatureType.realTimeRefunds:
        return AppConstants.realTimeRefundsAsset;
    }
  }
}
