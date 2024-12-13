import 'package:delivery_app/features/account/widgets/account_info_bar_widget.dart';
import 'package:delivery_app/features/account/widgets/account_info_section_widget.dart';
import 'package:delivery_app/features/account/widgets/ads_bar_widget.dart';
import 'package:delivery_app/features/account/widgets/logout_button_widget.dart';
import 'package:delivery_app/features/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/features/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/features/global_widgets/global_profile_card_widget.dart';
import 'package:delivery_app/features/global_widgets/global_user_card_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colors_manager.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});
  static String id = "AccountView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "الحساب",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            const AccountInfoSectionWidget(),
            SizedBox(
              height: AppSize.s20.h,
            ),
            Divider(
              color: ColorManager.socialButtonColor,
              height: AppSize.s1.h,
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            const AccountInfoBarWidget(),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalProfileCardWidget(
              fieldName: "الاسم بالكامل",
              fieldValue: "محمود احمد الفيشاوي",
            ),
            SizedBox(
              height: AppSize.s20.h,
            ),
            const GlobalProfileCardWidget(
              fieldName: "رقم الهاتف",
              fieldValue: "+20 000 111 2222",
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const AdsBarWidget(),
            SizedBox(
              height: AppSize.s100.h,
            ),
            const LogoutButtonWidget(),
          ],
        ),
      ),
    );
  }
}
