

import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/global_widgets/global_text_field_widget.dart';
import 'package:delivery_app/global_widgets/global_user_card_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DeliveryEditAccountView extends StatelessWidget {
  const DeliveryEditAccountView({super.key});

  static String id = "DeliveryEditAccountView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalCircularButtonWidget(
                    onTap: () {
                      Navigator.pop(context);
                    }, icon: Icons.arrow_back),
                Text(
                  "الحساب",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: AppSize.s30.w,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalUserCardWidget(
              radius: AppSize.s80, // screen util added inside the widget
            ),
            Text(
              "محمود الفيشاوي",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: AppSize.s5.h,
            ),
            Text(
              "انضم منذ 12 اكتوبر 2024",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: AppSize.s20.h,
            ),
            Divider(
              color: ColorManager.socialButtonColor,
              height: AppSize.s1.h,
            ),
            SizedBox(
              height: AppSize.s20.h,
            ),
            Row(
              children: [
                Text("الاسم بالكامل",
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalTextFieldWidget(
              hintText: "الاسم بالكامل",
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            Row(
              children: [
                Text("رقم الهاتف",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalTextFieldWidget(
              hintText: "رقم الهاتف",
              textInputType: TextInputType.phone,
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(AppSize.s10.r),
        child: GlobalButtonWidget(text: "تحديث", onTap: (){
          Navigator.pop(context);
        }, width: double.infinity),
      ),
    );
  }
}
