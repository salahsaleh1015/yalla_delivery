import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextFieldWidget extends StatelessWidget {
  const GlobalTextFieldWidget({
    super.key,
    required this.textInputType,
    required this.hintText,
    this.height,
  });
  final double? height;
  final TextInputType textInputType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s15.r),
        color: ColorManager.lightPrimary,
      ),
      height: height ?? AppSize.s50.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s15.r),
        child: TextField(
          cursorColor: ColorManager.primary,
          cursorHeight: AppSize.s25.h,
          maxLines: null, // Set this
          expands: true, // and this
          onSubmitted: (value) {},
          keyboardType: textInputType,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                right: AppPadding.p15.w,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSize.s15.r),
                  ),
                  borderSide: BorderSide(
                      color: ColorManager.primary, width: AppSize.s1.w)),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: ColorManager.hintColor,
                  ),
              fillColor: ColorManager.inputFillColor,
              filled: true),
        ),
      ),
    );
  }
}
