



import 'package:delivery_app/presentation/global_widgets/global_button_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductAmountSection extends StatelessWidget {
  const ProductAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Row(
          children: [
            amountButton(
              icon: Icons.add,
              onTap: () {},
            ),
            SizedBox(
              width: AppSize.s5.w,
            ),
            Text("10",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: FontSize.s22.sp)),
            SizedBox(
              width: AppSize.s5.w,
            ),
            amountButton(
              icon: Icons.remove,
              onTap: () {},
            ),
          ],
        ),
        GlobalButtonWidget(
          isButtonEnabled: true,
          text: "أضف",
          onTap: () {},
          borderRadius: AppSize.s10.r,
          width: AppSize.s70.w,
          height: AppSize.s25.h,
        ),
      ],
    );
  }

  Widget amountButton({required VoidCallback onTap ,required IconData icon}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSize.s15.h,
        width: AppSize.s20.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s5.r),
            color: ColorManager.darkGrayColor),
        child: Center(
          child: Icon(
            icon,
            color: ColorManager.white,
            size: AppSize.s15.r,
          ),
        ),
      ),
    );

  }
}

