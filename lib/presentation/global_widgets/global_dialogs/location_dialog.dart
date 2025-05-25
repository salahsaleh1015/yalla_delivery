
import 'package:delivery_app/presentation/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/presentation/global_widgets/global_text_field_widget.dart';

import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void locationDialog(BuildContext context) {
  showCustomDialog(context,
      actionButtonCallBack: () {},
      actionButtonHint: "تغيير",
      dialogTitle: "تغيير موقع التوصيل",
      content: const LocationDialogContent());
}


class LocationDialogContent extends StatelessWidget {
  const LocationDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "موقع التوصيل: ",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            ),
            SizedBox(
                width:
                MediaQuery
                    .of(context)
                    .size
                    .width * 0.4,
                child: Text("مدينة 6 أكتوبر، محافظة الجيزة",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium)),
          ],
        ),
        SizedBox(
          height: AppSize.s20.h,
        ),
        Text(
          "موقعك الان بالتفصيل",
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium,
        ),
        SizedBox(
          height: AppSize.s20.h,
        ),
        GlobalTextFieldWidget(

          height: AppSize.s200.h,
          hintText: "أدخل موقعك الان بالتفصيل",
          textInputType: TextInputType.multiline,
        ),
      ],
    );
  }
}