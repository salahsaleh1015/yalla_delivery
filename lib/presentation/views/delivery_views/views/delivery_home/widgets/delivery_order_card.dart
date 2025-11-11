import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/functions/status_switch.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../models/order_model.dart';
import '../../../../../view_models/delivery_view_models/delivery_orders_cubit/delivery_orders_cubit.dart';
import '../../../../admin_views/views/admin_delivery_management/widgets/delivery_status_badge.dart';
import '../../../../global_widgets/global_decorated_container.dart';

class DeliveryOrderCard extends StatelessWidget {
  const DeliveryOrderCard({super.key, required this.orderModel, required this.cardActionButtons, required this.orderIndex});

  final OrderModel orderModel;
  final Widget cardActionButtons;
  final int orderIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryOrdersCubit, DeliveryOrdersStates>(
      builder: (context, state) {
       // var cubit = DeliveryOrdersCubit.get(context);
        return GlobalDecoratedContainer(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.s15.w, vertical: AppSize.s25.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "رقم الطلب: ",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: ColorManager.darkGrayColor),
                    ),
                    Text(
                      " ${orderIndex+1}#  ",
                      style: Theme.of(context).textTheme.headlineMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Expanded(child: SizedBox()),
                    DeliveryStatusBadge(
                      statusColor:
                          getStatusBadgeColor(orderModel.userOrderStatus),
                      deliveryStatus: orderModel.userOrderStatus,
                      deliveryStatusColor:
                          getStatusTextColor(orderModel.userOrderStatus),
                    ),
                    // DeliveryStatusBadge(
                    //     statusColor:ColorManager.lightGrayColor,
                    //     deliveryStatus: orderModel.userOrderStatus,
                    //     deliveryStatusColor: ColorManager.darkGrayColor),
                  ],
                ),
                SizedBox(
                  height: AppSize.s5.h,
                ),
                buildOrderInfoStatement(
                  title: "المستخدم: ",
                  value: orderModel.userName,
                  context: context,
                ),
                SizedBox(
                  height: AppSize.s12.h,
                ),
                buildOrderInfoStatement(
                  title: "العنوان: ",
                  value: orderModel.userLocation,
                  context: context,
                ),
                SizedBox(
                  height: AppSize.s12.h,
                ),
                buildOrderInfoStatement(
                  title: "الوقت: ",
                  value: orderModel.userOrderDate,
                  context: context,
                ),
                SizedBox(
                  height: AppSize.s25.h,
                ),

                cardActionButtons,

              ],
            ));
      },
    );
  }

  Widget buildOrderInfoStatement(
          {required BuildContext context,
          required String title,
          required String value}) =>
      SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: ColorManager.darkGrayColor),
            ),
            Expanded(
              child: Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );


}
