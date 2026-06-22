import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/font_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/core/utils/popup_toast_helper.dart';
import 'package:delivery_app/data/repos/cart_repos/cart_repo_impl.dart';
import 'package:delivery_app/domain/usecases/cart_usecases/user_delete_order_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/delete_order_cubit/delete_order_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_light_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_models/user_view_models/cart_cubit/cart_orders_cubit/delete_order_cubit/delete_order_state.dart';

void deleteOrderDialog(BuildContext context,{required  String orderId}) {
  showCustomDialog(context,
      dialogTitle: "إالغاء الطلب",
      actionButtonColor: ColorManager.error,
      actionButtonHint: "إلغاء الطلب",
      content: DeleteOrderDialogContent(orderId:orderId ,));
}

class DeleteOrderDialogContent extends StatelessWidget {
  const DeleteOrderDialogContent({super.key, required this.orderId});
  final String orderId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteOrderCubit>(
      create: (context) =>
          DeleteOrderCubit(UserDeleteOrderUseCase(getIt.get<CartRepoImpl>())),
      child: BlocConsumer<DeleteOrderCubit, DeleteOrderStates>(
        listener: (context, state) {
          if (state is DeleteOrderErrorState) {
            showCustomToast(context, "هناك خطأ ما حاول في وقت لاحق",
                type: ToastType.error);
          } else if (state is DeleteOrderSuccessState) {
            showCustomToast(context, "تم مسح الطلب بنجاح",
                type: ToastType.success);
            Navigator.pushReplacementNamed(context, Routes.mainLayoutRoute);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: AppSize.s10.h,
              ),
              Text(
                "هل أنت متأكد أنك تريد إلغاء الطلب؟",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorManager.hintColor,
                    ),
              ),
              SizedBox(
                height: AppSize.s10.h,
              ),
              if (state is DeleteOrderLoadingState) const GlobalLoadingIndicator() else GlobalLightButtonWidget(
                      child: Text(
                        "مسح الطلب ",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: ColorManager.error,
                                fontSize: FontSize.s16.sp),
                      ),
                      onTap: () {

                        DeleteOrderCubit.get(context).deleteOrder(
                          orderId: orderId,
                        );
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}
