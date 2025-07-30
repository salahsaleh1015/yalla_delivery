import 'package:delivery_app/presentation/models/order_info_model.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_app_bar.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_button_widget.dart';
import '../../../../global_widgets/global_dialogs/confirm_order_dialog.dart';
import '../../../../global_widgets/global_rrder_details_widget.dart';
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppPadding.p8.r),
        child: GlobalButtonWidget(
          isButtonEnabled: true,
          text: "تأكيد الطلب",
          onTap: () {

            confirmOrderDialog(context);
          },
          width: double.infinity,
        ),
      ),
    );
  }
}
