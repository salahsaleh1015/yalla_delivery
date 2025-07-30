

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/values_manager.dart';

class GlobalNoDeliveriesWidget extends StatelessWidget {
  const GlobalNoDeliveriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.delivery_dining,
            size: AppSize.s150.r,
            color: ColorManager.primary,
          ),
          SizedBox(
            height: AppSize.s20.h,
          ),
          Text(
            "لا يوجد مندوبين",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}