import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_in_user_cubit/delivery_in_user_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_delivery_filtered_cards_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/delivery_cards_filtered_model.dart';

class GlobalAvailableDeliveryCardsListWidget extends StatefulWidget {
  const GlobalAvailableDeliveryCardsListWidget({
    super.key,
    required this.height,
    this.onSelectedDelivery,
  });
  final double height;
  final ValueChanged<DeliveryModel>? onSelectedDelivery;
  @override
  State<GlobalAvailableDeliveryCardsListWidget> createState() =>
      _GlobalAvailableDeliveryCardsListWidgetState();
}

class _GlobalAvailableDeliveryCardsListWidgetState
    extends State<GlobalAvailableDeliveryCardsListWidget> {
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
    print("Item clicked: $id");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryInUserCubit>(
      create: (context) => DeliveryInUserCubit()
        ..getAllDeliveriesByStatus(deliveryStatus: 'متاح'),
      child: BlocBuilder<DeliveryInUserCubit, DeliveryInUserStates>(
        builder: (context, state) {
          var cubit = DeliveryInUserCubit.get(context);

          return SizedBox(
            width: double.infinity,
            height: widget.height,
            child: ListView.builder(
                itemCount: cubit.deliveriesFilteredList.length,
                itemBuilder: (context, index) {
                  var delivery = DeliveryModel(
                    deliveryMail: cubit
                        .deliveriesFilteredList[index].deliveryMail,

                    deliveryPassword: cubit
                        .deliveriesFilteredList[index].deliveryPassword,
                    deliveryName: cubit
                        .deliveriesFilteredList[index].deliveryName,
                    deliveryPhone: cubit
                        .deliveriesFilteredList[index].deliveryPhone,
                    deliveryLocation: cubit
                        .deliveriesFilteredList[index].deliveryLocation,
                    deliveryStatus: cubit
                        .deliveriesFilteredList[index].deliveryStatus,
                    deliveryRate: cubit
                        .deliveriesFilteredList[index].deliveryRate,
                  );
                  return  GlobalDeliveryFilteredCardsWidget(
                    deliveryFilteredCardsModel: DeliveryFilteredCardsModel(
                        arrowOnTap: () {
                          ///todo index == _selectedIndex navigate to chat details view
                        },
                        onTap: () {
                          _onCardTap(index);
                          widget.onSelectedDelivery?.call(delivery);
                        },
                        isSelected: index == _selectedIndex,
                        deliveryModel: delivery),
                  );
                }
                   ),
          );
        },
      ),
    );
  }
}
