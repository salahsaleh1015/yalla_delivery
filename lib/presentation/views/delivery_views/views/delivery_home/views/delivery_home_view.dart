import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/delivery_status_drop_down_button.dart';

class DeliveryHomeView extends StatelessWidget {
  const DeliveryHomeView({super.key, required this.deliveryGmail});

  final String deliveryGmail;
  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 DeliveryStatusDropDownButton(
                   deliveryGmail: deliveryGmail,
                 ),
                CircleAvatar(
                  radius: AppSize.s30.r,
                  backgroundImage: const AssetImage(
                    AssetsManager.deliveryAvatar,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "الطلبات المعلقة",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s25.h,
            ),

          ],
        ),
      ),
    );
  }


}

