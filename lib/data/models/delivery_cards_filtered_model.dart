
import 'package:flutter/material.dart';

import 'delivery_model.dart';


class DeliveryFilteredCardsModel{
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback arrowOnTap;
  final DeliveryModel deliveryModel;
  DeliveryFilteredCardsModel({ required this.arrowOnTap, required this.isSelected,required this.onTap,required this.deliveryModel});
}

