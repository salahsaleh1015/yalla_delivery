



import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_main_card.dart';
import 'package:flutter/material.dart';

class CartMainCardListView extends StatelessWidget {
  const CartMainCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => const CartMainCard(),
      ),
    );
  }
}
