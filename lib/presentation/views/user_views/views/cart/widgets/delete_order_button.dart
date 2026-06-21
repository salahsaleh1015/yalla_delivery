import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/font_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_light_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteOrderButton extends StatelessWidget {
  const DeleteOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLightButtonWidget(
      child: Text(
        "مسح الطلب ",
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: ColorManager.error, fontSize: FontSize.s16.sp),
      ),
      onTap: () {},
    );
  }
}
