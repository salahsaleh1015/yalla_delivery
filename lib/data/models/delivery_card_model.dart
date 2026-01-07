

import 'package:delivery_app/data/models/delivery_model.dart';
import 'package:flutter/material.dart';

class DeliveryCardModel{

  final DeliveryModel deliveryModel;
  final String deliveryStatus;
  final VoidCallback onTap,arrowOnTap;


  DeliveryCardModel({required this.onTap,required this.arrowOnTap, required this.deliveryStatus, required this.deliveryModel});
}