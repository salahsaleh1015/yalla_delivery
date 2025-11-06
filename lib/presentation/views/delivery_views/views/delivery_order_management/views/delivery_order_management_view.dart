import 'package:delivery_app/core/resources/constants_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_order_management/widgets/delivery_management_orders_tab_bar_view.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/delivery_order_management_tab_bar.dart';

class DeliveryOrderManagementView extends StatelessWidget {
  const DeliveryOrderManagementView({super.key, required this.deliveryMail});

  final String deliveryMail;
  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
      child: DefaultTabController(
        length: AppConstant.managementTabBarLength,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              "الطلبات",
              style: Theme.of(context).textTheme.titleMedium,
            )),
            SizedBox(
              height: AppSize.s25.h,
            ),
            const DeliveryOrderManagementTabBar(),
            SizedBox(
              height: AppSize.s25.h,
            ),
            Text("جميع الطلبات المعلقة",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: AppSize.s25.h,
            ),
            DeliveryManagementOrdersTabBarView(
              deliveryMail: deliveryMail,
            ),
          ],
        ),
      ),
    );
  }
}
