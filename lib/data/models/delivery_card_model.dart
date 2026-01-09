

import 'package:delivery_app/data/models/delivery_model.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:flutter/material.dart';

class DeliveryCardModel{

  final DeliveryEntity deliveryModel;
  final String deliveryStatus;
  final VoidCallback onTap,arrowOnTap;


  DeliveryCardModel({required this.onTap,required this.arrowOnTap, required this.deliveryStatus, required this.deliveryModel});
}