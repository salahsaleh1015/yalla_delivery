import 'package:delivery_app/features/global_widgets/global_button_widget.dart';
import 'package:delivery_app/features/global_widgets/global_secondary_button.dart';
import 'package:delivery_app/features/global_widgets/global_text_field_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showCustomDialog(
  BuildContext context, {
  required Widget content,
  required String dialogTitle,
  required String actionButtonHint,
  required VoidCallback actionButtonCallBack,
  Color? actionButtonColor,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible:
        true, // User can dismiss the dialog by tapping outside of it
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorManager.white,
        contentPadding: EdgeInsets.all(AppPadding.p8.r),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dialogTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: FontSize.s22),
                ),
                SizedBox(
                  width: AppSize.s70.w,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: ColorManager.secondaryTextColor,
                    ))
              ],
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            Divider(
              thickness: 1,
              color: ColorManager.secondaryTextColor,
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            content,
          ],
        ),
        actions: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(AppSize.s2.r),
                child: GlobalSecondaryButton(
                  text: "إالغاء",
                  width: MediaQuery.of(context).size.width * 0.32,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppSize.s2.r),
                child: GlobalButtonWidget(
                  color: actionButtonColor ?? ColorManager.primary,
                  onTap: actionButtonCallBack,
                  width: MediaQuery.of(context).size.width * 0.32,
                  text: actionButtonHint,
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
