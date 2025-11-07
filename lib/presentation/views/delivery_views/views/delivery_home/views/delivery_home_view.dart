import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_home/widgets/delivery_home_header.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_home/widgets/delivery_pending_orders_card_list_view.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DeliveryHomeView extends StatelessWidget {
  const DeliveryHomeView({super.key, required this.deliveryGmail});

  final String deliveryGmail;
  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
      child: Column(
        children: [
          DeliveryHomeHeader(
            deliveryGmail: deliveryGmail,
          ),
          SizedBox(
            height: AppSize.s25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الطلبات المعلقة",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(
            height: AppSize.s5.h,
          ),

          Expanded(
            child: CustomScrollView(
              slivers: [
                DeliveryPendingOrdersCardListView(
                  deliveryMail: deliveryGmail,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
