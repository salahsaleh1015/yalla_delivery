

import 'package:flutter/material.dart';
import 'package:delivery_app/presentation/models/delivery_model.dart';

class DeliveryCardModel{

  final DeliveryModel deliveryModel;
  final String deliveryStatus;
  final VoidCallback onTap,arrowOnTap;


  DeliveryCardModel({required this.onTap,required this.arrowOnTap, required this.deliveryStatus, required this.deliveryModel});
}