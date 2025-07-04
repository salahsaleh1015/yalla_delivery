



import 'package:delivery_app/presentation/views/admin_views/views/admin_order_management/widgets/order_management_card.dart';
import 'package:flutter/material.dart';

class OrderManagementCardsList extends StatelessWidget {
  const OrderManagementCardsList({super.key, required this.orderStatus, required this.statusColor, required this.orderStatusColor});
  final String orderStatus;
  final Color statusColor;
  final Color orderStatusColor;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => OrderManagementCard(
            orderStatusColor:orderStatusColor,
            orderStatus:orderStatus,
            statusColor: statusColor,
          )),
    )
    ;
  }
}
