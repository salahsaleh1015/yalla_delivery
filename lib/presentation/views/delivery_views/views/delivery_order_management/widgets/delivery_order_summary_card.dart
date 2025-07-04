
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DeliveryOrderSummaryCard extends StatelessWidget {
  const DeliveryOrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.p8.h, horizontal: AppPadding.p24.w),
      child: Column(
        spacing: AppPadding.p16.h,
        children: [
          buildContentSection(
            context: context,
            title: "رقم الطلب",
            value: "50#",
          ),
          const GlobalDividerWidget(),
          buildContentSection(
            context: context,
            title: "المستخدم",
            value: "محمد احمد",
          ),
          const GlobalDividerWidget(),
          buildContentSection(
            context: context,
            title: "الموزع",
            value: "ابن البلد",
          ),
          const GlobalDividerWidget(),
          buildContentSection(
            context: context,
            title: "عنوان المستخدم",
            value: "مدينة 6 أكتوبر, محافظة الجيزة",
          ),
          const GlobalDividerWidget(),
          buildContentSection(
            context: context,
            title: "الطلب",
            value:
            "نقدًا عند التسليم نقدًا عند التسليمنقدًا عند التسليمنقدًا عند التسليمنقدًا عند التسليمنقدًا عند التسليم",
          ),
          const GlobalDividerWidget(),
          buildContentSection(
            context: context,
            title: "طريقة الدفع",
            value: "نقدًا عند التسليم",
          ),
          const GlobalDividerWidget(),
          buildContentSection(
            context: context,
            title: "الوقت",
            value: "03:00 م",
          ),
        ],
      ),
    );
  }

  Widget buildContentSection(
      {required BuildContext context,
        required String title,
        required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          width: AppSize.s180.w,
          child: Text(
            value,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: ColorManager.black),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }
}
