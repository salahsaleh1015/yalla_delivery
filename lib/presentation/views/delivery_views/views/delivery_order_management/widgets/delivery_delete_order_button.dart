
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/delete_order_from_delivery_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DeliveryDeleteOrderButton extends StatelessWidget {
  const DeliveryDeleteOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: (){
        deleteOrderFromDeliveryDialog(context);
      },
      child: Container(
        height:AppSize.s40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.lightSecondary,
          borderRadius: BorderRadius.circular(AppSize.s100.r),
        ),
        child: Center(
          child: Text("مسح الطلب",style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: ColorManager.error
          ),),
        ),
      ),
    );
  }
}
