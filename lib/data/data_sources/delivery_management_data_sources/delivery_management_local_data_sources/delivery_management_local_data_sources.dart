import 'package:delivery_app/core/utils/constants.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class DeliveryManagementLocalDataSource {
  List<DeliveryEntity> getAllDeliveries();
  List<DeliveryEntity> getAvailableDeliveries({required String status});
  List<DeliveryEntity> getBusyDeliveries({required String status});
  List<DeliveryEntity> getUnAvailableDeliveries({required String status});
}

class DeliveryManagementLocalDataSourceImpl
    implements DeliveryManagementLocalDataSource {
  @override
  List<DeliveryEntity> getAllDeliveries() {
    var box = Hive.box<DeliveryEntity>(kAllDeliveriesBox);
    return box.values.toList();
  }

  @override
  List<DeliveryEntity> getAvailableDeliveries({required String status}) {
    var box = Hive.box<DeliveryEntity>(kAvailableDeliveryBox);
    return box.values.toList();
  }

  @override
  List<DeliveryEntity> getBusyDeliveries({required String status}) {
    var box = Hive.box<DeliveryEntity>(kBusyDeliveryBox);
    return box.values.toList();
  }

  @override
  List<DeliveryEntity> getUnAvailableDeliveries({required String status}) {
    var box = Hive.box<DeliveryEntity>(kUnAvailableDeliveryBox);
    return box.values.toList();
  }
}
