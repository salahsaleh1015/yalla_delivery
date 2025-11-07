

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

class DeliveryHomeHeader extends StatelessWidget {
  const DeliveryHomeHeader({super.key, required this.deliveryGmail});

  final String deliveryGmail;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // DeliveryStatusDropDownButton(
        //   deliveryGmail: deliveryGmail,
        // ),
        CircleAvatar(
          radius: AppSize.s30.r,
          backgroundImage: const AssetImage(
            AssetsManager.deliveryAvatar,
          ),
        ),
      ],
    );
  }
}
