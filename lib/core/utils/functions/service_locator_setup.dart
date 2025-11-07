import 'package:get_it/get_it.dart';

import '../../../data/delivery_data/delivery_data_sources/local_data_sources/delivery_local_data_sources/delivery_account_local_data_source.dart';
import '../../../data/delivery_data/delivery_data_sources/remote_data_sources/delivery_remote_data_sources/delivery_account_remote_data_source.dart';
import '../../../data/delivery_data/delivery_repos/delivery_account_repo.dart';
import '../../../domain/delivery_domain/delivery_repos/delivery_account_repo.dart';
import '../../services/firebase_services/firestore_delivery_services.dart';


final getIt = GetIt.instance;

void serviceLocatorSetup() {
  // Firebase services
  getIt.registerSingleton<FirestoreDeliveryServices>(
      FirestoreDeliveryServices());

  // Data sources
  getIt.registerLazySingleton<DeliveryAccountRemoteDataSource>(
    () =>
        DeliveryAccountRemoteDataSourceImpl(getIt<FirestoreDeliveryServices>()),
  );

  getIt.registerLazySingleton<DeliveryAccountLocalDataSource>(
    () => DeliveryAccountLocalDataSourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<DeliveryAccountRepo>(
    () => DeliveryAccountRepoImpl(
      getIt<DeliveryAccountLocalDataSource>(),
      getIt<DeliveryAccountRemoteDataSource>(),
    ),
  );
}
