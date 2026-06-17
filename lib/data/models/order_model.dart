import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';

import 'delivery_model.dart';

class OrderModel extends OrderEntity {
  String? userOrderId;

  final String userName;
  final String userPhoneNumber;
  final String userLocation;
  final String userOrder;
  final String userOrderStatus;
  final String userOrderNotes;
  final String userOrderDate;

  final DeliveryModel delivery;

  OrderModel({
    this.userOrderId,
    required this.userName,
    required this.userPhoneNumber,
    required this.userLocation,
    required this.userOrder,
    required this.userOrderStatus,
    required this.userOrderNotes,
    required this.userOrderDate,
    required this.delivery,
  }) : super(
    userLocation: userLocation ?? '',
    orderDetails: userOrder ?? '',
    orderRequestTime: userOrderDate ?? '',
    userPhone: userPhoneNumber ?? '',
    orderStatus: userOrderStatus ?? '',
    userName: userName ?? '',
    orderNotes: userOrderNotes ?? '',
    deliveryName: delivery.name ?? '',
    orderId: userOrderId ?? '',);

  /// 🔽 FROM JSON
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      userOrderId: json['userOrderId'],
      userName: json['userName'] ?? '',
      userPhoneNumber: json['userPhoneNumber'] ?? '',
      userLocation: json['userLocation'] ?? '',
      userOrder: json['userOrder'] ?? '',
      userOrderStatus: json['userOrderStatus'] ?? '',
      userOrderNotes: json['userOrderNotes'] ?? '',
      userOrderDate: json['userOrderDate'] ?? '',

      /// 🔥 أهم نقطة
      delivery: DeliveryModel.fromJson(json),
    );
  }

  /// 🔼 TO JSON
  Map<String, dynamic> toJson() {
    return {
      'userOrderId': userOrderId,
      'userName': userName,
      'userPhoneNumber': userPhoneNumber,
      'userLocation': userLocation,
      'userOrder': userOrder,
      'userOrderStatus': userOrderStatus,
      'userOrderNotes': userOrderNotes,
      'userOrderDate': userOrderDate,

      /// 🔥 merge delivery data
      ...delivery.toJson(),
    };
  }
}
