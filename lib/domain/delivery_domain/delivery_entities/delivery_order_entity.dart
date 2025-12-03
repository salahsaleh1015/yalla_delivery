class DeliveryOrderEntity {
  final String userName;
  final String userLocation;
  final String userPhone;
  final String deliveryName;
  final String orderDetails;
  final String orderStatus;
  final String orderRequestTime;

  DeliveryOrderEntity(
      {required this.userName,
      required this.userLocation,
      required this.userPhone,
      required this.deliveryName,
      required this.orderDetails,
      required this.orderStatus,
      required this.orderRequestTime});
}
