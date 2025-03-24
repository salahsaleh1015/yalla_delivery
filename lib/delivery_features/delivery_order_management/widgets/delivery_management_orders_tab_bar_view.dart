

import 'package:delivery_app/delivery_features/delivery_order_management/widgets/delivery_management_order_cards_list.dart';

import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';




class DeliveryManagementOrdersTabBarView extends StatelessWidget {
  const DeliveryManagementOrdersTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.56,
      child: TabBarView(children: [
        DeliveryManagementOrderCardsList(
          onActionButtonTap: (){},
          statusColor: ColorManager.lightGrayColor,
          deliveryStatus: "معلقة",
          deliveryStatusColor: ColorManager.darkGrayColor,
          actionButtonTitle: "قبول",
          backButtonTitle: "رفض",
        ),
        DeliveryManagementOrderCardsList(
          statusColor: ColorManager.lightSecondary,
          deliveryStatus: "مقبولة",
          deliveryStatusColor: const Color(0xfffd724b),
        ),
        DeliveryManagementOrderCardsList(
          statusColor: ColorManager.lightDotColor,
          deliveryStatus: "ملغية",
          deliveryStatusColor: ColorManager.error,
        ),
        DeliveryManagementOrderCardsList(
          statusColor: ColorManager.lightGreenColor,
          deliveryStatus: "مكتملة",
          deliveryStatusColor: ColorManager.greenColor,
        ),
      ]),
    );
  }
}