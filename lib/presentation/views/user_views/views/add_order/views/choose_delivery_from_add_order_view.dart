import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/data/models/order_info_model.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_app_bar.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/lists/global_delivery_cards_for_shop_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../data/models/delivery_model.dart';



class ChooseDeliveryFromAddOrderView extends StatefulWidget {
  ChooseDeliveryFromAddOrderView(
      {super.key, required this.order});

  final String order;

  @override
  State<ChooseDeliveryFromAddOrderView> createState() => _ChooseDeliveryFromAddOrderViewState();
}

class _ChooseDeliveryFromAddOrderViewState extends State<ChooseDeliveryFromAddOrderView> {
  late DeliveryModel selectedDelivery;

  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalAppBar(title: "اختر التوصيل"),
          SizedBox(
            height: AppSize.s50.h,
          ),
          Text(
            "جميع مندوبي التوصيل المتاحين",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          GlobalAvailableDeliveryCardsListWidget(
            onSelectedDelivery: (delivery) {
              selectedDelivery = delivery as DeliveryModel;
              setState(() {
                isEnabled = true;
              });

            },
            height: MediaQuery.of(context).size.height * 0.65,
          ),
        ],
      )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppPadding.p8.r),
        child: GlobalButtonWidget(
          isButtonEnabled: isEnabled,
          text: "استمر",
          onTap: () {
            Navigator.pushNamed(context, Routes.orderSummaryRoute,
                arguments: OrderInfoModel(
                    deliveryModel: selectedDelivery,
                    order: widget.order,
                   ));
          },
          width: double.infinity,
        ),
      ),
    );
  }
}
