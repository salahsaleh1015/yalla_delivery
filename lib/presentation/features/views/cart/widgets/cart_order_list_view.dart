


import 'package:delivery_app/presentation/features/views/cart/widgets/cart_order.dart';
import 'package:flutter/material.dart';

class CartOrderListView extends StatelessWidget {
  const CartOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) => const CartOrder(),
    );
  }
}