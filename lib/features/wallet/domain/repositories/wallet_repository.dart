import '../entities/wallet_feature_entity.dart';

/// Contract that both domain and data layers depend on (Dependency Inversion).
/// Data layer provides the concrete implementation.
abstract class WalletRepository {
  /// Returns the ordered list of wallet feature highlights.
  List<WalletFeatureEntity> getWalletFeatures();
}
