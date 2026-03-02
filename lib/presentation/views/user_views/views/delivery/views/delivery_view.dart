import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/lists/global_all_delivery_cards_list_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/lists/global_busy_delivery_cards_list_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/lists/global_un_available_delivery_cards_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

import '../../../../global_widgets/global_circular_button_widget.dart';
import '../../../../global_widgets/lists/global_available_delivery_cards_list_widget.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: GlobalPaddingWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: AppSize.s30.w,
                  ),
                  Text(
                    "كل المندوبين",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: AppSize.s30.w,
                  ),
                  // GlobalCircularButtonWidget(
                  //   onTap: () {
                  //     //Navigator.pushNamed(context, CartView.id);
                  //   },
                  //   icon: Icons.shopping_cart_outlined,
                  // ),
                ],
              ),
              SizedBox(
                height: AppSize.s10.h,
              ),
              myTabBar(context),
              SizedBox(
                height: AppSize.s20.h,
              ),
              Text(
                "جميع مندوبي التوصيل المتاحين",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: AppSize.s10.h,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: TabBarView(
                  children: [
                    GlobalAllDeliveryCardsListWidget(
                      height: MediaQuery.of(context).size.height * 0.6,
                    ),
                    GlobalAvailableDeliveryCardsListWidget(
                      height: MediaQuery.of(context).size.height * 0.6,
                      isSelected: true,
                    ),
                    GlobalBusyDeliveryCardsListWidget(
                      height: MediaQuery.of(context).size.height * 0.6,
                      isSelected: false,
                    ),
                    GlobalUnAvailableDeliveryCardsListWidget(
                      height: MediaQuery.of(context).size.height * 0.6,
                      isSelected: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myTabBar(context) {
    return Container(
      height: AppSize.s50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.socialButtonColor,
          width: AppSize.s2.w,
        ),
        color: ColorManager.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppSize.s50.r),
      ),
      child: TabBar(
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: ColorManager.socialButtonColor),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: ColorManager.lightPrimary,
          borderRadius: BorderRadius.circular(AppSize.s50.r),
        ),
        tabs: const [
          Tab(
            text: "الكل",
          ),
          Tab(
            text: "متاح",
          ),
          Tab(
            text: "مشغول",
          ),
          Tab(
            text: "غير متاح",
          ),
        ],
      ),
    );
  }
}
