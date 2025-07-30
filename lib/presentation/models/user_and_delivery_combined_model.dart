import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:delivery_app/presentation/models/user_model.dart';

class UserAndDeliveryCombinedModel{
  final UserModel userModel;
  final DeliveryModel deliveryModel;

  UserAndDeliveryCombinedModel({required this.userModel, required this.deliveryModel});
}