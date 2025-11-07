import 'package:hive/hive.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../domain/delivery_domain/delivery_entities/delivery_account_entity.dart';

abstract class DeliveryAccountLocalDataSource {
 DeliveryAccountEntity fetchDeliveryAccountData();
  void saveDeliveryAccountData({
    required DeliveryAccountEntity delivery,
  });
  void editDeliveryAccountData({
    required DeliveryAccountEntity updatedDelivery,
  });
}


class DeliveryAccountLocalDataSourceImpl
    implements DeliveryAccountLocalDataSource {
  @override
 DeliveryAccountEntity fetchDeliveryAccountData()  {
    final box = Hive.box<DeliveryAccountEntity>(kDeliveryAccountBox);

    if (box.isEmpty) {
      throw Exception("No saved delivery account found locally");
    }

    // Assuming there’s only one delivery account saved
    return box.values.first;
  }

  @override
  void saveDeliveryAccountData({
    required DeliveryAccountEntity delivery,
  }) async {
    final box = Hive.box<DeliveryAccountEntity>(kDeliveryAccountBox);

    // Clear old data if you always store one delivery
    await box.clear();
    await box.add(delivery);
  }

  @override
  void editDeliveryAccountData({
    required DeliveryAccountEntity updatedDelivery,
  }) async {
    final box = Hive.box<DeliveryAccountEntity>(kDeliveryAccountBox);

    if (box.isEmpty) {
      throw Exception("No delivery account found to edit");
    }

    // Assuming there’s one delivery account (index = 0)
    await box.putAt(0, updatedDelivery);
  }
}
