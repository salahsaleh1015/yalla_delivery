import 'package:delivery_app/delivery_features/delivery_order_management/widgets/delivery_management_orders_tab_bar_view.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../resources/values_manager.dart';
import '../widgets/delivery_order_management_tab_bar.dart';

class DeliveryOrderManagementView extends StatelessWidget {
  const DeliveryOrderManagementView({super.key});

  static String id = "DeliveryOrderManagementView";
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
            const DeliveryManagementOrdersTabBarView() ,
          ],
        ),
      ),
    );
  }
}


