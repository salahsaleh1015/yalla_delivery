
import 'package:delivery_app/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/global_widgets/global_divider_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryDetailsItemWidget extends StatelessWidget {
  const SummaryDetailsItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(
      width: double.infinity,

      child: Padding(
        padding:  EdgeInsets.all(AppSize.s8.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "اسم المطعم",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "ابن البلد",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: ColorManager.black),
                ),
              ],
            ),
            const GlobalDividerWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الطلب",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height:  MediaQuery.of(context).size.height * 0.2,
                child: Center(
                  child: Text(
                    "1 X  ساعة ذكية رياضية",
                    maxLines: 50,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: ColorManager.black),
                  ),
                ),
              ),
            ],
          ),
            const GlobalDividerWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "إجمالي السعر",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(r"$101",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: FontSize.s22.sp,
                        )),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
