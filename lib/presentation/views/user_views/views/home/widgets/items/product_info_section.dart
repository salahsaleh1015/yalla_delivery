
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/font_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s130.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "دجاج هارت أتاك “سنجل”",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: ColorManager.primary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "برجر دجاج مشوي مع إضافات مميزة.",
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            r"$50",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.black),
          ),
        ],
      ),
    );
  }
}