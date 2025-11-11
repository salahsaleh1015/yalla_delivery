import 'package:delivery_app/domain/delivery_domain/delivery_entities/delivery_account_entity.dart';
import 'package:hive/hive.dart';

void saveDeliveryInfoData({
  required DeliveryInfoEntity delivery,
  required String boxName,
}) {
  var box = Hive.box<DeliveryInfoEntity>(boxName);
  box.put(delivery.deliveryPhone, delivery); // ✅ Use email as key
}

void saveDeliveryStatus({
  required String status,
  required String boxName,
}) {
  final box = Hive.box<DeliveryInfoEntity>(boxName);
  if (box.isNotEmpty) {
    final old = box.getAt(0)!;
    final updated = DeliveryInfoEntity(
      deliveryName: old.deliveryName,
      deliveryPhone: old.deliveryPhone,
      deliveryMail: old.deliveryMail,
      deliveryStatus: status,
      deliveryLocation: old.deliveryLocation,
    );
    box.putAt(0, updated);
  }
  print(" Delivery status updated to $status and saved locally");
}

void editSavedDeliveryInfoData({
  required String boxName,
  required String deliveryKey,
  required DeliveryInfoEntity updatedDelivery,
}) {
  var box = Hive.box<DeliveryInfoEntity>(boxName);
  box.put(deliveryKey, updatedDelivery); // ✅ fine
}
