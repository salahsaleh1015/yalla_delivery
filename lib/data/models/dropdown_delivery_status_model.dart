
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DropdownDeliveryStatusModel {
  const DropdownDeliveryStatusModel({
    required this.text,
  });
  final String text;
}

abstract class DeliveryStatusItems {
  static const List<DropdownDeliveryStatusModel> statusItems = [
    busy,
    available,
    notAvailable,
  ];

  static const busy = DropdownDeliveryStatusModel(text: 'مشغول',);
  static const available =
  DropdownDeliveryStatusModel(text: 'متاح',);
  static const notAvailable =
  DropdownDeliveryStatusModel(text: 'غير متاح',);

  static Widget buildItem(DropdownDeliveryStatusModel statusItem,DropdownDeliveryStatusModel? selectedItem) {
    bool isSelected = statusItem == selectedItem; // Check if the item is selected

    return Container(
 padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w,vertical: AppPadding.p2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12.r),
        color: isSelected?ColorManager.lightPrimary:ColorManager.transparent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            statusItem.text,
            style:  TextStyle(
              color: ColorManager.black,
            ),
          ),
          SizedBox(
            width: AppSize.s10.w,
          ),
        ],
      ),
    );
  }

  static void onChanged(BuildContext context, DropdownDeliveryStatusModel item) {
    switch (item) {
      case DeliveryStatusItems.busy:
        debugPrint('busy');
        break;
      case DeliveryStatusItems.available:
        debugPrint('available');
        break;
      case DeliveryStatusItems.notAvailable:
        debugPrint('notAvailable');
        break;
    }
  }

}