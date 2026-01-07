
class OrderModel {
  final String userName;
  final String userPhoneNumber;
  final String userLocation;
  final String userOrder;
  String? userOrderId;
  final String userOrderStatus;
  final String userOrderNotes;

  final String userOrderDate;
  final String deliveryName;
  final String deliveryPhone;
  final String deliveryLocation;
  final String deliveryStatus;
  final int deliveryRate;
  final String deliveryMail;

  OrderModel({
     this.userOrderId,
    required this.userName,
    required this.userPhoneNumber,
    required this.userLocation,
    required this.userOrder,
    required this.userOrderStatus,
    required this.userOrderNotes,

    required this.userOrderDate,
    required this.deliveryName,
    required this.deliveryPhone,
    required this.deliveryLocation,
    required this.deliveryStatus,
    required this.deliveryRate,
    required this.deliveryMail,
  });

  // Create an OrderModel from JSON
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      userOrderId: json['userOrderId'],
      userName: json['userName'],
      userPhoneNumber: json['userPhoneNumber'],
      userLocation: json['userLocation'],
      userOrder: json['userOrder'],
      userOrderStatus: json['userOrderStatus'],
      userOrderNotes: json['userOrderNotes'],

      userOrderDate: json['userOrderDate'],
      deliveryName: json['deliveryName'],
      deliveryPhone: json['deliveryPhone'],
      deliveryLocation: json['deliveryLocation'],
      deliveryStatus: json['deliveryStatus'],
      deliveryRate: json['deliveryRate'],
      deliveryMail: json['deliveryMail'],
    );
  }

  // Convert the OrderModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userPhoneNumber': userPhoneNumber,
      'userLocation': userLocation,
      'userOrder': userOrder,
      'userOrderStatus': userOrderStatus,
      'userOrderId': userOrderId,
      'userOrderNotes': userOrderNotes,

      'userOrderDate': userOrderDate,
      'deliveryName': deliveryName,
      'deliveryPhone': deliveryPhone,
      'deliveryLocation': deliveryLocation,
      'deliveryStatus': deliveryStatus,
      'deliveryRate': deliveryRate,
      'deliveryMail': deliveryMail
    };
  }
}
