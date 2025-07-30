
import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:flutter/material.dart';


class DeliveryFilteredCardsModel{
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback arrowOnTap;
  final DeliveryModel deliveryModel;
  DeliveryFilteredCardsModel({ required this.arrowOnTap, required this.isSelected,required this.onTap,required this.deliveryModel});
}

