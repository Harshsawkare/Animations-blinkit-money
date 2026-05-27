import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/wallet_feature_entity.dart';
import '../../domain/entities/wallet_feature_type.dart';

/// Local (in-memory) source of wallet feature data.
abstract class WalletLocalDataSource {
  List<WalletFeatureEntity> getFeatures();
}

class WalletLocalDataSourceImpl implements WalletLocalDataSource {
  const WalletLocalDataSourceImpl();

  @override
  List<WalletFeatureEntity> getFeatures() => const [
        WalletFeatureEntity(
          type: WalletFeatureType.singleTapPayment,
          title: AppConstants.featureSingleTapTitle,
          description: AppConstants.featureSingleTapDescription,
        ),
        WalletFeatureEntity(
          type: WalletFeatureType.zeroFailures,
          title: AppConstants.featureZeroFailuresTitle,
          description: AppConstants.featureZeroFailuresDescription,
        ),
        WalletFeatureEntity(
          type: WalletFeatureType.realTimeRefunds,
          title: AppConstants.featureRealTimeRefundsTitle,
          description: AppConstants.featureRealTimeRefundsDescription,
        ),
      ];
}
