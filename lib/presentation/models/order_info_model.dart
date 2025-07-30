

import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:delivery_app/presentation/models/user_model.dart';

class OrderInfoModel{
  final DeliveryModel deliveryModel;
  final String order;
  final UserModel userModel;

  OrderInfoModel({ required this.userModel, required this.deliveryModel, required this.order});
}