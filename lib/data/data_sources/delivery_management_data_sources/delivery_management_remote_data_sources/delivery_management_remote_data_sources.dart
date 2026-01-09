import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/utils/constants.dart';
import 'package:delivery_app/core/utils/functions/hive_functions.dart';
import 'package:delivery_app/data/models/delivery_model.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';

import '../../../../core/services/firebase_services/firestore_delivery_services.dart';

abstract class DeliveryManagementRemoteDataSources {
  Future<List<DeliveryEntity>> getAllDeliveries();
  Future<List<DeliveryEntity>> getAvailableDeliveries({required String status});
  Future<List<DeliveryEntity>> getBusyDeliveries({required String status});
  Future<List<DeliveryEntity>> getUnAvailableDeliveries(
      {required String status});
}

class DeliveryManagementRemoteDataSourcesImpl
    implements DeliveryManagementRemoteDataSources {
  DeliveryManagementRemoteDataSourcesImpl(this.firestoreDeliveryServices);

  FirestoreDeliveryServices firestoreDeliveryServices;

  @override
  Future<List<DeliveryEntity>> getAvailableDeliveries(
      {required String status}) async {
    var data = await firestoreDeliveryServices.getAllDeliveriesByStatus(
        deliveryStatus: status);
    List<DeliveryEntity> deliveries = getDeliveriesList(data);
    saveDeliveriesData(deliveries: deliveries, boxName: kAvailableDeliveryBox);
    return deliveries;
  }

  @override
  Future<List<DeliveryEntity>> getAllDeliveries() async {
    var data = await firestoreDeliveryServices.getAllDeliveries();
    List<DeliveryEntity> deliveries = getDeliveriesList(data);
    saveDeliveriesData(deliveries: deliveries, boxName: kAllDeliveriesBox);
    return deliveries;
  }

  @override
  Future<List<DeliveryEntity>> getBusyDeliveries({required String status}) async{
    var data = await firestoreDeliveryServices.getAllDeliveriesByStatus(
        deliveryStatus: status);
    List<DeliveryEntity> deliveries = getDeliveriesList(data);
    saveDeliveriesData(deliveries: deliveries, boxName: kBusyDeliveryBox);
    return deliveries;
  }

  @override
  Future<List<DeliveryEntity>> getUnAvailableDeliveries(
      {required String status}) async {
    var data = await firestoreDeliveryServices.getAllDeliveriesByStatus(
        deliveryStatus: status);
    List<DeliveryEntity> deliveries = getDeliveriesList(data);
    saveDeliveriesData(deliveries: deliveries, boxName: kUnAvailableDeliveryBox);
    return deliveries;
  }


  List<DeliveryEntity> getDeliveriesList(List<QueryDocumentSnapshot> docs) {
    List<DeliveryEntity> deliveries = [];

    for (var doc in docs) {
      deliveries
          .add(DeliveryModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    return deliveries;
  }
}
