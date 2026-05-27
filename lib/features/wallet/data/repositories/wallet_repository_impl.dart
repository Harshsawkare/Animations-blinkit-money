import '../../domain/entities/wallet_feature_entity.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../datasources/wallet_local_data_source.dart';

/// Concrete repository that wires the domain contract to the data source.
/// Isolates the domain layer from knowing how or where data is fetched.
class WalletRepositoryImpl implements WalletRepository {
  const WalletRepositoryImpl(this._dataSource);

  final WalletLocalDataSource _dataSource;

  @override
  List<WalletFeatureEntity> getWalletFeatures() => _dataSource.getFeatures();
}
