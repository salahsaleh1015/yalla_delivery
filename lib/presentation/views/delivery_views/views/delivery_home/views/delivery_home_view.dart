
import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_delivery_management/widgets/delivery_status_badge.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_light_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_view_all_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../widgets/delivery_status_drop_down_button.dart';

class DeliveryHomeView extends StatelessWidget {
  const DeliveryHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DeliveryStatusDropDownButton(),
                CircleAvatar(
                  radius: AppSize.s30.r,
                  backgroundImage: const AssetImage(
                    AssetsManager.deliveryAvatar,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الطلبات المعلقة",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                GlobalViewAllButton(
                  onPressed: () {},
                ),


              ],
            ),
            SizedBox(
              height: AppSize.s25.h,
            ),
            GlobalDecoratedContainer(

                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.s15.w, vertical: AppSize.s25.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "اسم المندوب : ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: ColorManager.darkGrayColor),
                        ),
                        Text(
                          "محمد سعيد",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Spacer(),
                        DeliveryStatusBadge(
                            statusColor: ColorManager.darkGrayColor,
                            deliveryStatus: "hhhhhh",
                            deliveryStatusColor: ColorManager.white),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s5.h,
                    ),
                    SizedBox(
                      height: AppSize.s12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "التليفون: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: ColorManager.darkGrayColor),
                        ),
                        Text(
                          "+20 111 222 3333",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "العنوان: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: ColorManager.darkGrayColor),
                        ),
                        Text(
                          "القاهرة",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
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
                          text: "تعديل",
                          onTap: () {},
                          width: MediaQuery.of(context).size.width * 0.41,
                          height: AppSize.s33.h,
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
