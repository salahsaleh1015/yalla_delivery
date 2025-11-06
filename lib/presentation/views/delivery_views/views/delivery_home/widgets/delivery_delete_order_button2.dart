



import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_light_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_manager.dart';

class DeliveryDeleteOrderButton2 extends StatelessWidget {
  const DeliveryDeleteOrderButton2({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return     GlobalLightButtonWidget(
      onTap: onTap,
      width: MediaQuery.of(context).size.width * 0.41,
      height: AppSize.s33.h,
      child: Text("مسح الطلب",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.error),),
    );
  }
}
