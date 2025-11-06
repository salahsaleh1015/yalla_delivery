
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/models/delivery_status_model.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_order_management/views/delivery_order_summary_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'delivery_management_order_card.dart';


//
// class DeliveryManagementOrderCardsList extends StatelessWidget {
//   const DeliveryManagementOrderCardsList({super.key, required this.statusColor, required this.deliveryStatus, required this.deliveryStatusColor,  this.backButtonTitle,  this.actionButtonTitle,  this.onActionButtonTap});
//
//   final Color statusColor;
//   final String deliveryStatus;
//   final Color deliveryStatusColor;
//   final String? backButtonTitle;
//   final String? actionButtonTitle;
//   final VoidCallback? onActionButtonTap;
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       height: MediaQuery.of(context).size.height * 0.56,
//       child: ListView.separated(
//         separatorBuilder: (context, index) => SizedBox(
//           height: AppSize.s10.h,
//         ),
//         itemCount: 10,
//         itemBuilder: (context, index) => DeliveryManagementOrderCard(
//
//           backButtonTitle: backButtonTitle,
//           actionButtonTitle: actionButtonTitle,
//           onActionButtonTap: onActionButtonTap??(){
//             Navigator.pushNamed(context, DeliveryOrderSummaryView.id,
//                 arguments:DeliveryStatusModel(
//                   statusColor: statusColor,
//                   deliveryStatus: deliveryStatus,
//                   deliveryStatusColor: deliveryStatusColor,
//                 ));
//           },
//           deliveryStatusColor: deliveryStatusColor,
//           deliveryStatus: deliveryStatus,
//           statusColor: statusColor,
//         ),
//       ),
//     );
//   }
// }