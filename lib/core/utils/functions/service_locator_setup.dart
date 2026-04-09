import 'package:delivery_app/core/services/firebase_services/firestore_feed_back_services.dart';
import 'package:delivery_app/core/services/firebase_services/firestore_home_services.dart';
import 'package:delivery_app/data/data_sources/delivery_management_data_sources/delivery_management_local_data_sources/delivery_management_local_data_sources.dart';
import 'package:delivery_app/data/data_sources/delivery_management_data_sources/delivery_management_remote_data_sources/delivery_management_remote_data_sources.dart';
import 'package:delivery_app/data/data_sources/feedback_data_source/feedback_data_source.dart';
import 'package:delivery_app/data/data_sources/home_data_sources/home_local_data_source/home_local_data_source.dart';
import 'package:delivery_app/data/data_sources/home_data_sources/home_remote_data_source/home_remote_data_source.dart';
import 'package:delivery_app/data/repos/delivery_management_repo/delivery_management_repo_impl.dart';
import 'package:delivery_app/data/repos/feedback_repos/feedback_repo.dart';
import 'package:delivery_app/data/repos/home_repo/home_repo_impl.dart';
import 'package:delivery_app/domain/repos/delivery_management_repos/delivery_management_repos.dart';
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

  getIt.registerSingleton<FireStoreFeedBackServices>(FireStoreFeedBackServices());



  // repo impl
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<FirestoreHomeServices>()),
    ),
  );

  getIt.registerSingleton<DeliveryManagementRepoImpl>(DeliveryManagementRepoImpl(
    deliveryManagementLocalDataSource:DeliveryManagementLocalDataSourceImpl() ,
    deliveryManagementRemoteDataSources: DeliveryManagementRemoteDataSourcesImpl(
        getIt.get<FirestoreDeliveryServices>()
    ),
  ));

  // repo impl
  getIt.registerSingleton<FeedBackRepoImpl>(
    FeedBackRepoImpl(

       FeedBackDataSourceImpl(getIt.get<FireStoreFeedBackServices>()),
    ),
  );

}
