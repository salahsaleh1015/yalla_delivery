import 'package:get_it/get_it.dart';


import '../../services/firebase_services/firestore_delivery_services.dart';
import '../../services/firebase_services/firestore_orders_services.dart';

final getIt = GetIt.instance;

void serviceLocatorSetup() {
  // Firebase services
  getIt.registerSingleton<FirestoreDeliveryServices>(
      FirestoreDeliveryServices());

  getIt.registerSingleton<FirestoreOrdersServices>(FirestoreOrdersServices());


}
