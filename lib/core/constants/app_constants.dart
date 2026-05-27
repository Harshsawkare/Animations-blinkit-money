/// App-wide constant values shared across layers.
class AppConstants {
  AppConstants._();

  // Layout
  static const double cardBorderRadius = 16.0;
  static const double cardPadding = 16.0;
  static const double screenHorizontalPadding = 16.0;
  static const double featureCardIconSize = 56.0;
  static const double walletIllustrationSize = 110.0;
  static const double addMoneyButtonHeight = 54.0;
  static const double addMoneyButtonRadius = 12.0;

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;

  // Dot background
  static const double dotRadius = 1.2;
  static const double dotSpacing = 18.0;
  static const double dotOpacity = 0.25;

  // Assets
  static const String walletAsset = 'assets/wallet.png';
  static const String confettiAsset = 'assets/confetti.json';
  static const String singleTapPaymentAsset = 'assets/singleTapPayments.png';
  static const String zeroFailuresAsset = 'assets/zeroFailures.png';
  static const String realTimeRefundsAsset = 'assets/realTimeRefunds.png';

  // Strings — brand
  static const String appName = 'Harsh Sawkare';
  static const String brandName = 'blinkit';
  static const String brandTitle = 'MONEY';
  static const String watermarkText = 'Enjoy seamless\none tap payments';

  // Strings — labels
  static const String addMoneyLabel = 'Add Money';
  static const String claimGiftCardTitle = 'Claim Gift Card';
  static const String claimGiftCardSubtitle = 'Enter gift card details to claim your gift card';

  // Strings — feature cards
  static const String featureSingleTapTitle = 'Single tap payments';
  static const String featureSingleTapDescription = 'Enjoy seamless payments without the wait for OTPs';
  static const String featureZeroFailuresTitle = 'Zero failures';
  static const String featureZeroFailuresDescription = 'Zero payment failures ensure you never miss an order';
  static const String featureRealTimeRefundsTitle = 'Real-time refunds';
  static const String featureRealTimeRefundsDescription = 'No need to wait for refunds. Blinkit Money refunds are instant!';
}
