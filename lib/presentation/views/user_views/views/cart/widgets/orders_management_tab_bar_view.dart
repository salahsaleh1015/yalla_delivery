import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/orders_lists/accepted_orders_card_list_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/orders_lists/cancelled_orders_card_list_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/orders_lists/completed_orders_card_list_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/orders_lists/pending_orders_card_list_view.dart';
import 'package:flutter/material.dart';

class OrdersManagementTabBarView extends StatelessWidget {
  const OrdersManagementTabBarView({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        // DeliveryPendingOrdersCardListView(
        //   deliveryPhone:deliveryPhone,
        // ),
        DeliveryPendingOrdersCardListView(
          phoneNumber: phoneNumber,
        ),
        DeliveryAcceptedOrdersCardListView(
          phoneNumber: phoneNumber,
        ),
        DeliveryCancelledOrdersCardListView(
          phoneNumber: phoneNumber,
        ),
        DeliveryCompletedOrdersCardListView(
          phoneNumber: phoneNumber,
        ),
        // DeliveryCanceledOrdersCardListView(
        //   deliveryMail: deliveryPhone,
        // ),
        // DeliveryCompletedOrdersCardListView(
        //   deliveryMail: deliveryPhone,
        // ),
      ]),
    );
  }
}
