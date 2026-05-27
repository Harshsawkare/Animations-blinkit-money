import 'wallet_feature_type.dart';

/// Pure domain model — no Flutter/UI dependencies.
/// Represents a single feature highlight shown on the wallet screen.
class WalletFeatureEntity {
  const WalletFeatureEntity({
    required this.type,
    required this.title,
    required this.description,
  });

  /// Determines which illustreation is used to render this feature.
  final WalletFeatureType type;

  final String title;
  final String description;
}
