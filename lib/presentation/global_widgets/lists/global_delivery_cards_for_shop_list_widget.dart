
import 'package:delivery_app/presentation/global_widgets/global_delivery_card_widget.dart';
import 'package:flutter/material.dart';



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
              GlobalDeliveryCardWidget(
                arrowOnTap: () => _onCardTap(index),
                itemId: "item_$index", // Pass unique item IDs
                isSelected: _selectedIndex == index, // Determine if this item is selected
                onTap: () => _onCardTap(index), // Handle tap event
              )),
    );
  }
}

