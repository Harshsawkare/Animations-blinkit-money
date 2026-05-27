import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';

/// Row tile that lets the user navigate to the gift card redemption flow.
/// Separated from the feature cards so it can be individually tapped or hidden.
class ClaimGiftCardWidget extends StatelessWidget {
  const ClaimGiftCardWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.screenHorizontalPadding,
          vertical: AppConstants.spacingS,
        ),
        child: Row(
          children: [
            // Gift card illustration (box with ribbon)
            _GiftCardIcon(),

            const SizedBox(width: AppConstants.spacingM),

            // Titles
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Claim Gift Card', style: AppTextStyles.claimTitle),
                  SizedBox(height: 2),
                  Text(
                    'Enter gift card details to claim your gift card',
                    style: AppTextStyles.claimSubtitle,
                  ),
                ],
              ),
            ),

            // Chevron
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom gift-card box icon drawn purely with Canvas to avoid asset dependencies.
class _GiftCardIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.card_giftcard_rounded, color: AppColors.giftCardOrange, size: 32,);
  }
}
