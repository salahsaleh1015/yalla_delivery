
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_delivery_management/widgets/delivery_management_card.dart';
import 'package:flutter/material.dart';

class DeliveryManagementCardsList extends StatelessWidget {
  const DeliveryManagementCardsList({
    super.key, required this.statusColor, required this.deliveryStatus, required this.deliveryStatusColor,
  });

  final Color statusColor;
  final String deliveryStatus;
  final Color deliveryStatusColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.56,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p10),
                child: DeliveryManagementCard(
                  statusColor: statusColor,
                  deliveryStatus: deliveryStatus,
                  deliveryStatusColor: deliveryStatusColor,
                ),
              );
            }));
  }
}
