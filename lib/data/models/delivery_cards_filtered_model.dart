
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:flutter/material.dart';

import 'delivery_model.dart';


class DeliveryFilteredCardsModel{
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback arrowOnTap;
  final DeliveryEntity deliveryModel;
  DeliveryFilteredCardsModel({ required this.arrowOnTap, required this.isSelected,required this.onTap,required this.deliveryModel});
}

