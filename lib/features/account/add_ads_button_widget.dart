


import 'package:delivery_app/global_widgets/global_dialogs/add_ads_dialoge.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAdsButtonWidget extends StatelessWidget {
  const AddAdsButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: (){
        addAdsDialog(context);
      },
      child: Container(
        width: AppSize.s180.w,
        height: AppSize.s40.h,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(AppSize.s50.r),

        ),
        child: Center(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.add,color: ColorManager.white, size: AppSize.s20.sp,),
              Text("إضافة شريك الإعلان",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorManager.white,
                  fontSize: FontSize.s14.sp
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
