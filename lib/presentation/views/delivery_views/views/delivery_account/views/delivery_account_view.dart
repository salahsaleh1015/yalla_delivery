
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_account/views/delivery_edit_account_view.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_account_info_bar_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_account_info_section_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_ads_bar_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_profile_card_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_logout_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/account/views/ads_partner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DeliveryAccountView extends StatelessWidget {
  const DeliveryAccountView({super.key, required this.deliveryGmail});

final String deliveryGmail;
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
            const GlobalAccountInfoSectionWidget(
              joinDate: "انضم منذ 12 اكتوبر 2024",

              userName: "محمود الفيشاوي",
            ),
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
            GlobalAccountInfoBarWidget(
              onPressed: (){
                Navigator.pushNamed(context, DeliveryEditAccountView.id);
              },
            ),
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

            GlobalAdsBarWidget(
              onPressed: (){
                Navigator.pushNamed(context, AdsPartnerView.id);
              },
            ),
            SizedBox(
              height: AppSize.s50.h,
            ),
            const GlobalLogoutButtonWidget(),
          ],
        ),
      ),
    );
  }
}
