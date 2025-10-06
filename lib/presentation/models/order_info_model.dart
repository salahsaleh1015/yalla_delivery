

import 'package:delivery_app/presentation/models/delivery_model.dart';

class OrderInfoModel{
  final DeliveryModel deliveryModel;
  final String order;


  OrderInfoModel({ required this.deliveryModel, required this.order});
}