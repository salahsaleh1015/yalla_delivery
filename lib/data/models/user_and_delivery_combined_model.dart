

import 'package:delivery_app/data/models/cached_user_model.dart';
import 'package:delivery_app/data/models/delivery_model.dart';

class UserAndDeliveryCombinedModel{
  final CachedUserModel cachedUserModel;
  final DeliveryModel deliveryModel;

  UserAndDeliveryCombinedModel({required this.cachedUserModel, required this.deliveryModel});
}