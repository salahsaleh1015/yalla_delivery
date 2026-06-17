import 'package:delivery_app/core/utils/constants.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:hive/hive.dart';

abstract class CartLocalDataSource {
  List<OrderEntity> fetchPendingOrders();
  List<OrderEntity> fetchCanceledOrders();
  List<OrderEntity> fetchCompletedOrders();
  List<OrderEntity> fetchAcceptedOrders();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  @override
  List<OrderEntity> fetchAcceptedOrders() {
    var box = Hive.box<OrderEntity>(kAcceptedOrdersBox);
    return box.values.toList();
  }

  @override
  List<OrderEntity> fetchCanceledOrders() {
    var box = Hive.box<OrderEntity>(kCanceledOrdersBox);
    return box.values.toList();
  }

  @override
  List<OrderEntity> fetchCompletedOrders() {
    var box = Hive.box<OrderEntity>(kCompletedOrdersBox);
    return box.values.toList();
  }

  @override
  List<OrderEntity> fetchPendingOrders() {
    var box = Hive.box<OrderEntity>(kPendingOrdersBox);
    return box.values.toList();
  }
}
