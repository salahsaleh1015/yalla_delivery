

import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_manager.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key, required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin:  EdgeInsets.all(AppMargin.m16.r),
        decoration:  BoxDecoration(
            color: ColorManager.primary,
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(AppSize.s20.r),
              topRight: Radius.circular(AppSize.s20.r),
              bottomRight: Radius.circular(AppSize.s20.r),
            )
        ),
        padding:  EdgeInsets.symmetric(horizontal: AppPadding.p15.w,vertical: AppPadding.p8.h),
        child:  Text(message,style: const TextStyle(color: Colors.white),),),
    );
  }
}


class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    super.key, required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(

        margin: EdgeInsets.all(AppMargin.m16.r),
        decoration:  BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.s20.r),
              topRight: Radius.circular(AppSize.s20.r),
              bottomLeft: Radius.circular(AppSize.s20.r),
            )
        ),
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p15.w,vertical: AppPadding.p8.h),
        child:  Text(message,style:  TextStyle(color: ColorManager.black),),),
    );
  }
}