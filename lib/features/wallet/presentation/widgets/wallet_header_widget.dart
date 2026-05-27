import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';

/// Displays the top section of the wallet screen:
/// back button, settings icon, 3-D wallet illustration, and brand name.
class WalletHeaderWidget extends StatelessWidget {
  const WalletHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: AppConstants.spacingL),

        // ── Wallet 3-D illustration ───────────────────────────────────────
        SizedBox(
          width: AppConstants.walletIllustrationSize,
          height: AppConstants.walletIllustrationSize,
          child: Image.asset(AppConstants.walletAsset),
        ),

        const SizedBox(height: AppConstants.spacingM),

        // ── Brand name ────────────────────────────────────────────────────
        const Text(AppConstants.brandName, style: AppTextStyles.brandName),
        const Text(AppConstants.brandTitle, style: AppTextStyles.brandTitle),
      ],
    );
  }
}