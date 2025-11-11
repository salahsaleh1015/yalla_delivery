import 'package:hive/hive.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../domain/delivery_domain/delivery_entities/delivery_account_entity.dart';

// abstract class DeliveryInfoLocalDataSource {
//   DeliveryInfoEntity fetchDeliveryAccountData();
//   String fetchDeliveryStatus({required String deliveryMail});
//   void saveDeliveryAccountData({
//     required DeliveryInfoEntity delivery,
//   });
//   void editDeliveryAccountData({
//     required DeliveryInfoEntity updatedDelivery,
//   });
// }
//
// class DeliveryInfoLocalDataSourceImpl
//     implements DeliveryInfoLocalDataSource {
//   @override
//   DeliveryInfoEntity fetchDeliveryAccountData() {
//     final box = Hive.box<DeliveryInfoEntity>(kDeliveryInfoBox);
//
//     if (box.isEmpty) {
//       throw Exception("No saved delivery account found locally");
//     }
//
//     // Assuming there’s only one delivery account saved
//     return box.values.first;
//   }
//
//   @override
//   void saveDeliveryAccountData({
//     required DeliveryInfoEntity delivery,
//   }) async {
//     final box = Hive.box<DeliveryInfoEntity>(kDeliveryInfoBox);
//
//     // Clear old data if you always store one delivery
//     await box.clear();
//     await box.add(delivery);
//   }
//
//   @override
//   void editDeliveryAccountData({
//     required DeliveryInfoEntity updatedDelivery,
//   }) async {
//     final box = Hive.box<DeliveryInfoEntity>(kDeliveryInfoBox);
//
//     if (box.isEmpty) {
//       throw Exception("No delivery account found to edit");
//     }
//
//     // Assuming there’s one delivery account (index = 0)
//     await box.putAt(0, updatedDelivery);
//   }
//
//   @override
//   String fetchDeliveryStatus({required String deliveryMail}) {
//     final box = Hive.box<DeliveryInfoEntity>(kDeliveryInfoBox);
//
//     if (box.isEmpty) {
//       throw Exception("No saved delivery account found locally");
//     }
//
//     // Assuming there’s only one saved delivery info (index = 0)
//     final delivery = box.getAt(0);
//
//     if (delivery == null) {
//       throw Exception("No delivery data found in local storage");
//     }
//
//     return delivery.deliveryStatus;
//   }
//
// }
abstract class DeliveryInfoLocalDataSource {
  DeliveryInfoEntity? fetchDeliveryAccountData();
  String? fetchDeliveryStatus({required String deliveryMail});
  Future<void> saveDeliveryAccountData({required DeliveryInfoEntity delivery});
  Future<void> editDeliveryAccountData({required DeliveryInfoEntity updatedDelivery});
}

class DeliveryInfoLocalDataSourceImpl implements DeliveryInfoLocalDataSource {
  @override
  DeliveryInfoEntity? fetchDeliveryAccountData() {
    final box = Hive.box<DeliveryInfoEntity>(kDeliveryInfoBox);

    if (box.isEmpty) return null; // بدل Exception

    // Assuming there’s only one delivery account saved
    return box.values.first;
  }

  @override
  String? fetchDeliveryStatus({required String deliveryMail}) {
    final box = Hive.box<DeliveryInfoEntity>(kDeliveryInfoBox);

    if (box.isEmpty) return null; // بدل Exception

    final delivery = box.getAt(0);
    return delivery?.deliveryStatus;
  }

  @override
  Future<void> saveDeliveryAccountData({required DeliveryInfoEntity delivery}) async {
    final box = Hive.box<DeliveryInfoEntity>(kDeliveryInfoBox);

    // Clear old data if always storing one delivery
    await box.clear();
    await box.add(delivery);
  }

  @override
  Future<void> editDeliveryAccountData({required DeliveryInfoEntity updatedDelivery}) async {
    final box = Hive.box<DeliveryInfoEntity>(kDeliveryInfoBox);

    if (box.isEmpty) {
      // بدل Exception ممكن نخزن البيانات مباشرة إذا فاضي
      await box.add(updatedDelivery);
      return;
    }

    // Update the first saved delivery
    await box.putAt(0, updatedDelivery);
  }
}
