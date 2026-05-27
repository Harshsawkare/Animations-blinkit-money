import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';

/// Full-width green CTA button that initiates the "Add Money" flow.
class AddMoneyButtonWidget extends StatelessWidget {
  const AddMoneyButtonWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppConstants.addMoneyButtonHeight,
        decoration: BoxDecoration(
          color: AppColors.brandGreenDark,
          borderRadius: BorderRadius.circular(AppConstants.addMoneyButtonRadius),
        ),
        alignment: Alignment.center,
        child: const Text('Add Money', style: AppTextStyles.addMoneyButton),
      ),
    );
  }
}
