import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../models/order_model.dart';
import '../../../../admin_views/views/admin_delivery_management/widgets/delivery_status_badge.dart';
import '../../../../global_widgets/global_decorated_container.dart';
import '../../../../global_widgets/global_light_button_widget.dart';
class DeliveryOrderCard extends StatelessWidget {
  const DeliveryOrderCard({super.key,required this.orderModel});

  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return  GlobalDecoratedContainer(
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
                  " 50#  ",
                  style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const Expanded(child: SizedBox()),

                DeliveryStatusBadge(
                    statusColor: ColorManager.lightGrayColor,
                    deliveryStatus: orderModel.userOrderStatus,
                    deliveryStatusColor: ColorManager.darkGrayColor),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GlobalLightButtonWidget(
                  onTap: () {},
                  width: MediaQuery.of(context).size.width * 0.41,
                  height: AppSize.s33.h,
                  child: Text(
                    "حذف",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: ColorManager.error),
                  ),
                ),
                GlobalButtonWidget(
                  isButtonEnabled: true,
                  text: "قبول",
                  onTap: () {},
                  width: MediaQuery.of(context).size.width * 0.41,
                  height: AppSize.s33.h,
                ),
              ],
            )
          ],
        ));
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
