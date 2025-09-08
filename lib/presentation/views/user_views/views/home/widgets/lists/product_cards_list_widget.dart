
import 'package:delivery_app/presentation/views/user_views/views/home/widgets/items/product_card_item_widget.dart';
import 'package:flutter/material.dart';

class ProductCardsListWidget extends StatelessWidget {
  const ProductCardsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(

        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(

            itemCount: 10,
            itemBuilder:
                (context, index) => const ProductCardItemWidget()));
  }
}
