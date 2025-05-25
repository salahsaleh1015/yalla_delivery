
import 'package:delivery_app/presentation/features/views/delivery/views/add_order_from_delivery_view.dart';
import 'package:delivery_app/presentation/global_widgets/global_delivery_card_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GlobalDeliveryCardsListWidget extends StatelessWidget {
  const GlobalDeliveryCardsListWidget({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: height,
      child: ListView.builder(itemBuilder: (context, index) => GlobalDeliveryCardWidget(
        arrowOnTap: (){
          // Navigator.pushNamed(context, ChatView.id);
        },
        onTap: (){
          Navigator.pushNamed(context, AddOrderFromDeliveryView.id);
        },
        isSelected: false,
        itemId:"item_$index",
      )),
    );
  }
}
