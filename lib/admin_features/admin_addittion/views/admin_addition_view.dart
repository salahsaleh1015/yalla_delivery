import 'package:delivery_app/admin_features/admin_addittion/widgets/addition_tab_bar.dart';
import 'package:delivery_app/admin_features/admin_addittion/widgets/admin_add_ads_partner_body_widget.dart';
import 'package:delivery_app/admin_features/admin_addittion/widgets/admin_add_delivery_body_widget.dart';
import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/global_widgets/global_text_field_widget.dart';

import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAdditionView extends StatelessWidget {
  const AdminAdditionView({super.key});

  static const String id = 'AdminAdditionView';

  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
      child: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Text(
                "اضافات سريعة",
                style: Theme.of(context).textTheme.titleMedium,
              )),
              SizedBox(
                height: AppSize.s50.h,
              ),
              const AdditionTabBar(),
              SizedBox(
                height: AppSize.s30.h,
              ),
              SizedBox(
                height: AppSize.s800,
                width: MediaQuery.of(context).size.width,
                child: const TabBarView(children: [
                  AdminAddAdsPartnerBodyWidget(),
                  AdminAddDeliveryBodyWidget(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
