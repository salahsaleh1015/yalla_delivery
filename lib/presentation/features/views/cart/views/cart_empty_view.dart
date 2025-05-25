


import 'package:delivery_app/presentation/features/views/main_layout/views/main_layout_view.dart';
import 'package:delivery_app/presentation/global_widgets/global_button_widget.dart';
import 'package:delivery_app/resources/assets_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartEmptyView extends StatelessWidget {
  const CartEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage(AssetsManager.emptyCart,)),

            Text("لا توجد طلبات",style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: AppSize.s10.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
              child: Text("لم تقم بإضافة اي طلبات الي السلة... اضغط علي الزر اسفل للإضافة.",style: Theme.of(context).textTheme.labelSmall,textAlign: TextAlign.center,),
              
            ),
            SizedBox(height: AppSize.s30.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
              child: GlobalButtonWidget(
                isButtonEnabled: true,
                text: "إضافة طلب + ", onTap: (){
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainLayoutView.id,
                      (Route<dynamic> route) => false,
                );
              }, width: double.infinity,),
            ),
          ],
        ),
      ),
    );
  }
}
