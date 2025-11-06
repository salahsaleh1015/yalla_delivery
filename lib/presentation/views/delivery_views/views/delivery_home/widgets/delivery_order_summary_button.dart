


import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';

class DeliveryOrderSummaryButton extends StatelessWidget {
  const DeliveryOrderSummaryButton({super.key, required this.onTap});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GlobalButtonWidget(
      isButtonEnabled: true,
      text: "ملخص الطلب",
      onTap: onTap,
      width: MediaQuery.of(context).size.width * 0.41,
      height: AppSize.s33.h,
    );
  }
}
