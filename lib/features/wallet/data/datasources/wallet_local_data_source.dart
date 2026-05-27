import '../../domain/entities/wallet_feature_entity.dart';
import '../../domain/entities/wallet_feature_type.dart';

/// Local (in-memory) source of wallet feature data.
/// In a real app this could be replaced with a remote API or database source.
abstract class WalletLocalDataSource {
  List<WalletFeatureEntity> getFeatures();
}

class WalletLocalDataSourceImpl implements WalletLocalDataSource {
  const WalletLocalDataSourceImpl();

  @override
  List<WalletFeatureEntity> getFeatures() => const [
        WalletFeatureEntity(
          type: WalletFeatureType.singleTapPayment,
          title: 'Single tap payments',
          description:
              'Enjoy seamless payments without the wait for OTPs',
        ),
        WalletFeatureEntity(
          type: WalletFeatureType.zeroFailures,
          title: 'Zero failures',
          description:
              'Zero payment failures ensure you never miss an order',
        ),
        WalletFeatureEntity(
          type: WalletFeatureType.realTimeRefunds,
          title: 'Real-time refunds',
          description:
              'No need to wait for refunds. Blinkit Money refunds are instant!',
        ),
      ];
}
