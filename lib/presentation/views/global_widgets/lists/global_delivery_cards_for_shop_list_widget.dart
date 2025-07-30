
import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_delivery_filtered_cards_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/delivery/views/add_order_from_delivery_view.dart';
import 'package:flutter/material.dart';

import '../../../models/delivery_cards_filtered_model.dart';



class GlobalDeliveryCardsForShopListWidget extends StatefulWidget {
  const GlobalDeliveryCardsForShopListWidget({super.key, required this.height});
  final double height;
  @override
  State<GlobalDeliveryCardsForShopListWidget> createState() => _GlobalDeliveryCardsForShopListWidgetState();
}

class _GlobalDeliveryCardsForShopListWidgetState extends State<GlobalDeliveryCardsForShopListWidget> {
  int _selectedIndex = 0;
  // Track the selected index
  void _onCardTap(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
    // Call your function with the clicked item's ID
    _handleItemClick("item_$index");
  }

  void _handleItemClick(String id) {
    // Handle the click event, e.g., navigate or show a dialog
    print("Item clicked: $id");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) =>
              GlobalDeliveryFilteredCardsWidget(
                deliveryFilteredCardsModel: DeliveryFilteredCardsModel(
                  arrowOnTap: (){},

                    onTap: () {

                    },

                    isSelected: true,
                    deliveryModel: DeliveryModel(
                        deliveryName: "Delivery Name",
                        deliveryPhone: "Delivery Phone",
                        deliveryLocation: "Delivery Location",
                        deliveryStatus: "Delivery Status",
                        deliveryRate:5,)),
              )),
    );
  }
}

