

import 'package:delivery_app/domain/delivery_domain/delivery_entities/delivery_account_entity.dart';
import 'package:hive/hive.dart';

void saveDeliveryAccountData({
  required DeliveryAccountEntity delivery,
  required String boxName,
}) {
  var box = Hive.box<DeliveryAccountEntity>(boxName);
  box.put(delivery.deliveryPhone, delivery); // ✅ Use email as key
}



void editSavedDeliveryAccountData({
  required String boxName,
  required String deliveryKey,
  required DeliveryAccountEntity updatedDelivery,
}) {
  var box = Hive.box<DeliveryAccountEntity>(boxName);
  box.put(deliveryKey, updatedDelivery); // ✅ fine
}
