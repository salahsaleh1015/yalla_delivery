



import 'package:delivery_app/global_widgets/global_advertisement_item_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalAdvertisementListWidget extends StatelessWidget {
  const GlobalAdvertisementListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s150.h,
      child: ListView.separated(
        separatorBuilder: (context, index) =>  SizedBox(width: AppSize.s10.w),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
          itemBuilder: (context, index) => const GlobalAdvertisementItemWidget(),
          ),
    );
  }
}
