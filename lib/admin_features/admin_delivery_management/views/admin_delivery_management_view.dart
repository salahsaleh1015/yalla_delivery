import 'package:delivery_app/admin_features/admin_delivery_management/widgets/admin_add_delivery_bar.dart';
import 'package:delivery_app/admin_features/admin_delivery_management/widgets/delivery_management_tab_bar.dart';
import 'package:delivery_app/admin_features/admin_delivery_management/widgets/delivery_management_tab_bar_view.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/constants_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AdminDeliveryManagementView extends StatelessWidget {
  const AdminDeliveryManagementView({super.key});

  static String id = "AdminDeliveryManagementView";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConstant.managementTabBarLength,
      child: GlobalPaddingWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            "إدارة الديلفرات",
            style: Theme.of(context).textTheme.titleMedium,
          )),
          SizedBox(
            height: AppSize.s25.h,
          ),
          const DeliveryManagementTabBar(),
          SizedBox(
            height: AppSize.s30.h,
          ),
          const AdminAddDeliveryBar(),
          SizedBox(
            height: AppSize.s15.h,
          ),
          const DeliveryManagementTabBarView(),
        ],
      )),
    );
  }
}
