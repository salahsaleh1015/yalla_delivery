import 'package:delivery_app/core/services/firebase_services/firestore_home_services.dart';
import 'package:delivery_app/data/data_sources/home_data_sources/home_local_data_source/home_local_data_source.dart';
import 'package:delivery_app/data/data_sources/home_data_sources/home_remote_data_source/home_remote_data_source.dart';
import 'package:delivery_app/data/repos/home_repo/home_repo_impl.dart';
import 'package:get_it/get_it.dart';


import '../../services/firebase_services/firestore_delivery_services.dart';
import '../../services/firebase_services/firestore_orders_services.dart';

final getIt = GetIt.instance;

void serviceLocatorSetup() {
  // Firebase services
  getIt.registerSingleton<FirestoreDeliveryServices>(
      FirestoreDeliveryServices());

  getIt.registerSingleton<FirestoreOrdersServices>(FirestoreOrdersServices());

  getIt.registerSingleton<FirestoreHomeServices>(FirestoreHomeServices());

  // repo impl
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<FirestoreHomeServices>()),
    ),
  );
}
