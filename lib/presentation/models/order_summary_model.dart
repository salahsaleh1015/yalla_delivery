import 'package:delivery_app/presentation/models/delivery_model.dart';

class OrderSummaryModel {
  final String userLocation;
  final String orderDetails;
  final String orderNotes;
  final DeliveryModel delivery;

  OrderSummaryModel(
      {required this.userLocation,
      required this.orderDetails,
      required this.orderNotes,
      required this.delivery});
}
