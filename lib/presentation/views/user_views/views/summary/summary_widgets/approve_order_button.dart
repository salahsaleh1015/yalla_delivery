import 'package:delivery_app/data/models/delivery_model.dart';

import 'package:delivery_app/data/models/order_model.dart';

import 'package:delivery_app/presentation/view_models/user_view_models/user_orders_cubit/user_orders_cubit.dart';

import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../data/models/approve_order_model.dart';
import '../../../../global_widgets/global_button_widget.dart';

class ApproveOrderButton extends StatelessWidget {
  const ApproveOrderButton(
      {super.key, required this.approveOrderModel,});

  final ApproveOrderModel approveOrderModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserOrdersCubit>(
      create: (context) => UserOrdersCubit(),
      child: BlocBuilder<UserOrdersCubit, UserOrdersStates>(
        builder: (context, state) {
          var cubit = UserOrdersCubit.get(context);
          if (state is UserOrdersAddOrderLoadingState) {
            return Center(
              child: GlobalLoadingIndicator(),
            );
          } else if (state is UserOrdersAddOrderErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is UserOrdersAddOrderSuccessState) {
            return Padding(
              padding: EdgeInsets.all(AppPadding.p8.r),
              child: GlobalButtonWidget(
                isButtonEnabled: false,
                text: "تأكيد الطلب",
                onTap: () {},
                width: double.infinity,
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(AppPadding.p8.r),
              child: GlobalButtonWidget(
                isButtonEnabled: true,
                text: "تأكيد الطلب",
                onTap: () {
                  final now = DateTime.now();
                  final formattedTime = DateFormat('EEEE d MMMM hh:mm a', 'ar')
                      .format(now)
                      .replaceAll('AM', 'ص')
                      .replaceAll('PM', 'م');
                  cubit
                      .addOrder(
                    order: OrderModel(
                      userName: approveOrderModel
                          .userCachingCubit.cachedUserModel.userName,
                      userPhoneNumber: approveOrderModel
                          .userCachingCubit.cachedUserModel.phoneNumber,
                      userLocation: approveOrderModel.userLocation == ''
                          ? approveOrderModel
                              .userCachingCubit.cachedUserModel.userLocation
                          : approveOrderModel.userLocation,
                      userOrder: approveOrderModel.orderInfoModel.order,
                      userOrderStatus: 'المعلقة',
                      userOrderNotes: approveOrderModel.userNote ?? '',
                      userOrderDate: formattedTime,

                      /// 🔥 أهم تعديل هنا
                      delivery: DeliveryModel(
                        id: approveOrderModel.orderInfoModel.deliveryModel.id,
                        name:
                            approveOrderModel.orderInfoModel.deliveryModel.name,
                        phone: approveOrderModel
                            .orderInfoModel.deliveryModel.phone,
                        location: approveOrderModel
                            .orderInfoModel.deliveryModel.location,
                        status: approveOrderModel
                            .orderInfoModel.deliveryModel.status,
                        rate:
                            approveOrderModel.orderInfoModel.deliveryModel.rate,
                        mail:
                            approveOrderModel.orderInfoModel.deliveryModel.mail,
                      ),
                    ),
                  )
                      .then((_) {
                    confirmationDialog(context);
                  });
                  print(formattedTime);
                },
                width: double.infinity,
              ),
            );
          }
        },
      ),
    );
  }

  void confirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.of(context, rootNavigator: true).pop();
        });
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s20.r),
          ),
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.all(AppSize.s20.r),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: ColorManager.primary,
                size: AppSize.s50.r,
              ),
              SizedBox(
                height: AppSize.s20.h,
              ),
              Text(
                "تم ابلاغ المندوب بنجاح",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSize.s20.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
