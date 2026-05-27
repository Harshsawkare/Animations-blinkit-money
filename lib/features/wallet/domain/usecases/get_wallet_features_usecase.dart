import '../entities/wallet_feature_entity.dart';
import '../repositories/wallet_repository.dart';

/// Single-responsibility use case: fetches and returns wallet feature highlights.
class GetWalletFeaturesUseCase {
  const GetWalletFeaturesUseCase(this._repository);

  final WalletRepository _repository;

  /// Executes the use case and returns the list of features.
  List<WalletFeatureEntity> call() => _repository.getWalletFeatures();
}
