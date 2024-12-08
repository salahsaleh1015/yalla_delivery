import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextFieldWidget extends StatelessWidget {
  const GlobalTextFieldWidget({super.key, required this.textInputType, required this.hintText, this.height, this.focusedBorder, this.enabledBorder});
  final double? height;
  final TextInputType textInputType;
  final String hintText;
  final InputBorder ? focusedBorder;
  final InputBorder ? enabledBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.lightPrimary,
      height:height ?? AppSize.s50.h,

      child: TextField(
        maxLines: null, // Set this
        expands: true, // and this
        onSubmitted: (value) {},
        keyboardType:textInputType,
        decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: AppPadding.p15.h,),
             enabledBorder:enabledBorder ?? UnderlineInputBorder(
               borderSide: BorderSide(color: ColorManager.black),
             ),

            focusedBorder: focusedBorder ??UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.primary)),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.hintColor,),
            fillColor: ColorManager.inputFillColor,
            filled: true),
      ),
    );
  }
}
