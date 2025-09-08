import 'package:delivery_app/presentation/models/cached_user_model.dart';
import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:delivery_app/presentation/models/user_model.dart';

class UserAndDeliveryCombinedModel{
  final CachedUserModel cachedUserModel;
  final DeliveryModel deliveryModel;

  UserAndDeliveryCombinedModel({required this.cachedUserModel, required this.deliveryModel});
}