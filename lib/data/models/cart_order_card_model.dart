


import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:flutter/material.dart';

class CartOrderCardModel {
  final Color statusColor;
  final String deliveryStatus;
  final Color deliveryStatusColor;
  final String? actionButtonTitle;
  final String? backButtonTitle;
  final OrderEntity orderEntity;
  final VoidCallback onActionButtonTap;

  CartOrderCardModel(
      {required this.statusColor,
        required this.deliveryStatus,
        required this.orderEntity,
        required this.deliveryStatusColor,
        required this.actionButtonTitle,
        required this.backButtonTitle,
        required this.onActionButtonTap});
}
