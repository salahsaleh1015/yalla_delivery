import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/data/delivery_data/delivery_models/delivery_Info_model.dart';

import '../../../../../core/services/firebase_services/firestore_delivery_services.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/local_delivery_account_data_functions.dart';
import '../../../../../domain/delivery_domain/delivery_entities/delivery_account_entity.dart';

abstract class DeliveryInfoRemoteDataSource {
  Future<DeliveryInfoEntity> fetchDeliveryAccountData(
      {required String deliveryMail});

  Future<void> editDeliveryAccountData(
      {required DeliveryInfoEntity deliveryAccountEntity});

  Future<String> getDeliveryStatus({required String deliveryMail});
}

class DeliveryInfoRemoteDataSourceImpl
    implements DeliveryInfoRemoteDataSource {
  FirestoreDeliveryServices firestoreDeliveryServices;
  DeliveryInfoRemoteDataSourceImpl(this.firestoreDeliveryServices);

  @override
  Future<DeliveryInfoEntity> fetchDeliveryAccountData(
      {required String deliveryMail}) async {
    var deliveryDoc = await firestoreDeliveryServices.getDeliveryByMail(
      mail: deliveryMail,
    );
    var delivery = mapDeliveryDocumentToEntity(deliveryDoc!);

    // save delivery to local
    saveDeliveryInfoData(delivery: delivery, boxName: kDeliveryInfoBox);

    return delivery;
  }

  @override
  Future<void> editDeliveryAccountData(
      {required DeliveryInfoEntity deliveryAccountEntity}) async {
    await firestoreDeliveryServices.editDeliveryInfoByEmail(
        email: deliveryAccountEntity.deliveryMail,
        name: deliveryAccountEntity.deliveryName,
        location: deliveryAccountEntity.deliveryLocation,
        phoneNumber: deliveryAccountEntity.deliveryPhone);

    editSavedDeliveryInfoData(
      boxName: kDeliveryInfoBox,
      deliveryKey: deliveryAccountEntity.deliveryPhone,
      updatedDelivery: deliveryAccountEntity,
    );
  }

  DeliveryInfoEntity mapDeliveryDocumentToEntity(
      QueryDocumentSnapshot deliveryDoc) {
    final data = deliveryDoc.data() as Map<String, dynamic>;
    return DeliveryInfoModel.fromJson(data);
  }

  @override
  Future<String> getDeliveryStatus({required String deliveryMail}) async {

    return await firestoreDeliveryServices.getDeliveryStatusByEmail(
        email: deliveryMail);

  }
}
