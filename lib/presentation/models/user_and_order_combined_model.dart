


import 'package:delivery_app/presentation/models/cached_user_model.dart';

class UserAndOrderCombinedModel {

  final CachedUserModel userModel;
  final String order ;

  UserAndOrderCombinedModel({required this.userModel, required this.order});
}