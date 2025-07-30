
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/font_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesSectionItemWidget extends StatelessWidget {
  const NotesSectionItemWidget({super.key,});


  @override
  Widget build(BuildContext context) {
    return  Card.outlined(
      color: ColorManager.white,
      elevation: AppSize.s5.r,
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p8.r),
        child: SizedBox(
          height: AppSize.s30.h,
          width: MediaQuery.of(context).size.width,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: AppPadding.p8.h,
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.mode_edit_outline_outlined,
                size: AppSize.s25.r,
              ),
              hintText: "هل هناك ملاحظات حول الاستلام؟",
              hintStyle:
              Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }
}
