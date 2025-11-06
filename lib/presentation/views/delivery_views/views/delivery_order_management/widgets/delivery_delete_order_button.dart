import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/view_models/delivery_view_models/delivery_orders_cubit/delivery_orders_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/delete_order_from_delivery_dialog.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/popup_toast_helper.dart';
import '../../../../../../core/utils/snack_bar_helper.dart';

class DeliveryDeleteOrderButton extends StatelessWidget {
  const DeliveryDeleteOrderButton(
      {super.key, required this.orderId, required this.deliveryMail});

  final String deliveryMail;
  final String orderId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryOrdersCubit>(
      create: (context) => DeliveryOrdersCubit(),
      child: BlocConsumer<DeliveryOrdersCubit, DeliveryOrdersStates>(
        listener: (context, state) {
          if (state is DeliveryDeleteOrderErrorState) {
            SnackBarHelper.showSnackBar(
                context: context, message: " حدث خطاء حاول في وقت لاحق");
          }

          if (state is DeliveryDeleteOrderSuccessState) {
            Navigator.pushReplacementNamed(
                context, Routes.deliveryMainLayoutRoute,
                arguments: deliveryMail);

            showCustomToast(context, 'تم التعديل بنجاح',
              backgroundColor: ColorManager.primary,
            );(context, 'تم الحذف بنجاح');
          }
        },
        builder: (context, state) {
          var cubit = DeliveryOrdersCubit.get(context);

          if (state is DeliveryDeleteOrderLoadingState) {
            return const Center(child: GlobalLoadingIndicator());
          } else {
            return GestureDetector(
              onTap: () {
                cubit.deleteOrder(orderId: orderId);
              },
              child: Container(
                height: AppSize.s40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorManager.lightPrimary,
                  borderRadius: BorderRadius.circular(AppSize.s100.r),
                ),
                child: Center(
                  child: Text(
                    "مسح الطلب",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: ColorManager.error),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
