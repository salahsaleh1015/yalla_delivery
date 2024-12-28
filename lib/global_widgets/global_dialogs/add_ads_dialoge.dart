import 'package:delivery_app/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/global_widgets/global_text_field_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void addAdsDialog(BuildContext context) {
  showCustomDialog(context,
      content: const AddAdsDialogContent(),
      dialogTitle: "إضافة شريك الإعلان",
      actionButtonHint: "إضافة",
      actionButtonCallBack: () {});
}


class AddAdsDialogContent extends StatelessWidget {
  const AddAdsDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSize.s5.h,
        ),
        Container(
          height: AppSize.s100.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorManager.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(AppSize.s8.r),
          ),
          child: Center(

            child: GestureDetector(
              onTap: (){},
              child: Container(
                width: MediaQuery.of(context).size.width/3,
                height: AppSize.s30.h,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(AppSize.s8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.camera_alt,color: ColorManager.white, size: AppSize.s20.sp,),
                    Text("إضافة صورة",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.white,fontSize: FontSize.s14.sp),),

                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppSize.s20.h,
        ),
        Text(
          "الاسم",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.text,
            hintText: "ادخل الاسم"),
        SizedBox(
          height: AppSize.s10.h,
        ),
      ],
    );
  }
}
