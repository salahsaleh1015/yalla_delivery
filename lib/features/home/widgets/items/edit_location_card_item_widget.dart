
import 'package:delivery_app/global_widgets/global_dialogs/location_dialog.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditLocationCardItemWidget extends StatelessWidget {
  const EditLocationCardItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: ColorManager.white,
      elevation: AppSize.s5.r,
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p8.r),
        child: SizedBox(
            height: AppSize.s30.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "موقع التوصيل:",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      "مدينة 6 أكتوبر، محافظة الجيزة",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.black),
                    )),
                TextButton(
                  onPressed: () {
                    locationDialog(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        "تغيير",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: ColorManager.primary,
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }


}

