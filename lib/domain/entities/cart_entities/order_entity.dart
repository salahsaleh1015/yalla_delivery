class OrderEntity {
  final String orderDetails;
  final String orderStatus;
  final String orderNotes;
  final String orderDate;

  OrderEntity(
      {required this.orderDetails,
      required this.orderStatus,
      required this.orderNotes,
      required this.orderDate});
}
