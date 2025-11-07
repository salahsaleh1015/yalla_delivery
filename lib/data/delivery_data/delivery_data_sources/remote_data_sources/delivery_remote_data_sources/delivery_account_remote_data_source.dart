import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/data/delivery_data/delivery_models/delivery_account_model.dart';

import '../../../../../core/services/firebase_services/firestore_delivery_services.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/local_delivery_account_data_functions.dart';
import '../../../../../domain/delivery_domain/delivery_entities/delivery_account_entity.dart';


abstract class DeliveryAccountRemoteDataSource {
  Future<DeliveryAccountEntity> fetchDeliveryAccountData(
      {required String deliveryMail});

  Future<void> editDeliveryAccountData(
      {
      required DeliveryAccountEntity deliveryAccountEntity});
}

class DeliveryAccountRemoteDataSourceImpl
    implements DeliveryAccountRemoteDataSource {
  FirestoreDeliveryServices firestoreDeliveryServices;
  DeliveryAccountRemoteDataSourceImpl(this.firestoreDeliveryServices);

  @override
  Future<DeliveryAccountEntity> fetchDeliveryAccountData(
      {required String deliveryMail}) async {
    var deliveryDoc = await firestoreDeliveryServices.getDeliveryByMail(
      mail: deliveryMail,
    );
    var delivery = mapDeliveryDocumentToEntity(deliveryDoc!);

    // save delivery to local
    saveDeliveryAccountData(delivery: delivery, boxName: kDeliveryAccountBox);
    return delivery;
  }

  @override
  Future<void> editDeliveryAccountData(
      {
      required DeliveryAccountEntity deliveryAccountEntity}) async {
    await firestoreDeliveryServices.editDeliveryInfoByEmail(
        email: deliveryAccountEntity.deliveryMail,
        name: deliveryAccountEntity.deliveryName,
        location: deliveryAccountEntity.deliveryLocation,
        phoneNumber: deliveryAccountEntity.deliveryPhone);

    editSavedDeliveryAccountData(
      boxName: kDeliveryAccountBox,
      deliveryKey: deliveryAccountEntity.deliveryPhone,
      updatedDelivery: deliveryAccountEntity,
    );
  }

  DeliveryAccountEntity mapDeliveryDocumentToEntity(
      QueryDocumentSnapshot deliveryDoc) {
    final data = deliveryDoc.data() as Map<String, dynamic>;
    return DeliveryAccountModel.fromJson(data);
  }
}
