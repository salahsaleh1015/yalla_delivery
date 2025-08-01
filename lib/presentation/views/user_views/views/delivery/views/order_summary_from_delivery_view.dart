import 'package:delivery_app/presentation/models/order_info_model.dart';
import 'package:delivery_app/presentation/models/order_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_orders_cubit/user_orders_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_app_bar.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_button_widget.dart';
import '../../../../global_widgets/global_dialogs/confirm_order_dialog.dart';
import '../../../../global_widgets/global_loading_indicator.dart';
import '../../../../global_widgets/global_rrder_details_widget.dart';
import '../../../../global_widgets/global_something_wrong_widget.dart';
import '../../home/widgets/items/edit_location_card_item_widget.dart';
import '../../home/widgets/items/notes_section_item_widget.dart';
import '../../home/widgets/items/summary_delivery_item_widget.dart';

class OrderSummaryFromDeliveryView extends StatelessWidget {
  OrderSummaryFromDeliveryView({
    super.key,
    required this.orderInfoModel,
  });

  final OrderInfoModel orderInfoModel;

  String? userNote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalAppBar(title: "ملخص الطلب"),
              SizedBox(
                height: AppSize.s30.h,
              ),
              EditLocationCardItemWidget(
                userPhone: orderInfoModel.userModel.phoneNumber,
                //location: orderInfoModel.userModel.userLocation,
              ),
              SizedBox(
                height: AppSize.s15.h,
              ),
              Text("تفاصيل الطلب",
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                height: AppSize.s15.h,
              ),
              GlobalOrderDetailsWidget(
                orderDetails: orderInfoModel.order,
              ),
              SizedBox(
                height: AppSize.s20.h,
              ),
              Text("تفاصيل التوصيل",
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                height: AppSize.s15.h,
              ),
              SummaryDeliveryItemWidget(
                deliveryName: orderInfoModel.deliveryModel.deliveryName,
                deliveryRate: orderInfoModel.deliveryModel.deliveryRate,
              ),
              SizedBox(
                height: AppSize.s15.h,
              ),
              NotesSectionItemWidget(
                onSubmitted: (value) {
                  userNote = value;
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocProvider<UserOrdersCubit>(
        create: (context) => UserOrdersCubit(),
        child: BlocBuilder<UserOrdersCubit, UserOrdersStates>(
          builder: (context, state) {
            var cubit = UserOrdersCubit.get(context);
            if (state is UserOrdersAddOrderLoadingState) {
              return const Center(
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
                  onTap: () {

                  },
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
                    cubit
                        .addOrder(
                            order: OrderModel(
                      userName: orderInfoModel.userModel.userName,
                      userPhoneNumber: orderInfoModel.userModel.phoneNumber,
                      userLocation: orderInfoModel.userModel.userLocation,
                      userOrder: orderInfoModel.order,
                      userOrderStatus: 'قيد التنفيذ',
                      userOrderNotes: userNote ?? '',
                      userOrderDate: DateTime.now(),
                      deliveryName: orderInfoModel.deliveryModel.deliveryName,
                      deliveryPhone: orderInfoModel.deliveryModel.deliveryPhone,
                      deliveryLocation:
                          orderInfoModel.deliveryModel.deliveryLocation,
                      deliveryStatus:
                          orderInfoModel.deliveryModel.deliveryStatus,
                      deliveryRate: orderInfoModel.deliveryModel.deliveryRate,
                    ))
                        .then((_) {
                      confirmationDialog(context);
                    });
                  },
                  width: double.infinity,
                ),
              );
            }
          },
        ),
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
                "تم إرسال الطلب بنجاح",
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
