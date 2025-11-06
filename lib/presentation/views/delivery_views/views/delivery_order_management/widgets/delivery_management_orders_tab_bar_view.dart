import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_home/widgets/delivery_accepted_orders_card_list_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_home/widgets/delivery_canceled_orders_card_list_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_home/widgets/delivery_completed_orders_card_list_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_home/widgets/delivery_pending_orders_card_list_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_order_management/widgets/delivery_management_order_cards_list.dart';
import 'package:flutter/material.dart';

class DeliveryManagementOrdersTabBarView extends StatelessWidget {
  const DeliveryManagementOrdersTabBarView({super.key, required this.deliveryMail});

  final String deliveryMail;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: TabBarView(children: [
        CustomScrollView(
          slivers: [
            DeliveryPendingOrdersCardListView(
              deliveryMail:deliveryMail,
            ),
          ],
        ),
        CustomScrollView(
          slivers: [
            DeliveryAcceptedOrdersCardListView(
              deliveryMail: deliveryMail,
            ),
          ],
        ),
        CustomScrollView(
          slivers: [
            DeliveryCanceledOrdersCardListView(
              deliveryMail: deliveryMail,
            ),
          ],
        ),
        CustomScrollView(
          slivers: [
            DeliveryCompletedOrdersCardListView(
              deliveryMail: deliveryMail,
            ),
          ],
        ),
      ]),
    );
  }
}
