import 'package:delivery_app/global_widgets/global_user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/values_manager.dart';

class AccountInfoSectionWidget extends StatelessWidget {
  const AccountInfoSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        const GlobalUserCardWidget(
          radius: AppSize.s80, // screen util added inside the widget
        ),
        SizedBox(
          width: AppSize.s10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("محمود الفيشاوي",style: Theme.of(context).textTheme.titleMedium,),
            Text("انضم منذ 12 اكتوبر 2024",style: Theme.of(context).textTheme.headlineSmall,),
          ],
        )
      ],
    );
  }
}
