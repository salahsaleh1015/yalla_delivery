

import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class GlobalLoadingIndicator extends StatelessWidget {
  const GlobalLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        height: AppSize.s30.h,
        width: AppSize.s50.w,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScalePulseOutRapid,
          colors: [
            ColorManager.primary,
          ],
          backgroundColor: ColorManager.scaffoldBackgroundColor,
          pathBackgroundColor: ColorManager.primary,
        ),
      ),
    );
  }
}