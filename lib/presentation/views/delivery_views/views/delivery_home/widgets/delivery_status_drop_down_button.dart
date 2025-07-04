
import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../models/dropdown_delivery_status_model.dart';

class DeliveryStatusDropDownButton extends StatefulWidget {
  const DeliveryStatusDropDownButton({super.key});

  @override
  State<DeliveryStatusDropDownButton> createState() => _DeliveryStatusDropDownButtonState();
}

class _DeliveryStatusDropDownButtonState extends State<DeliveryStatusDropDownButton> {

  DropdownDeliveryStatusModel selectedStatus = DeliveryStatusItems.available;
  @override
  Widget build(BuildContext context) {
    return  DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: [
          ...DeliveryStatusItems.statusItems.map((item) =>
              DropdownMenuItem<DropdownDeliveryStatusModel>(
                value: item,
                child: DeliveryStatusItems.buildItem(item,selectedStatus),
              ))
        ],
        customButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s8.r),
              color: ColorManager.arrowBackBackGroundColor),
          width: AppSize.s120.w,
          height: AppSize.s40.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AssetsManager.editIcon,
                height: AppSize.s25.h,
                width: AppSize.s25.w,
                fit: BoxFit.fill,
              ),
              Text(
                selectedStatus.text ,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Icon(
                size: AppSize.s25.r,
                Icons.arrow_drop_down_sharp,
                color: ColorManager.black,
              ),
            ],
          ),
        ),
        menuItemStyleData:  MenuItemStyleData(

          padding: EdgeInsets.only(left: AppPadding.p16.w, right: AppPadding.p16.w),
        ),
        onChanged: (value) {
          setState(() {
            selectedStatus = value!;
          });
          DeliveryStatusItems.onChanged(context, value!);
        },
        dropdownStyleData: DropdownStyleData(
          width:AppSize.s250.w,
          padding:  EdgeInsets.symmetric(vertical: AppPadding.p16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s25.r),
            color: ColorManager.white,
          ),

        ),

      ),
    );
  }
}
