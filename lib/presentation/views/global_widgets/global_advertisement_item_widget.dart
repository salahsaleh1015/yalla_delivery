import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_custom_animation_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_secondary_decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/assets_manager.dart';

class GlobalAdvertisementItemWidget extends StatelessWidget {
  const GlobalAdvertisementItemWidget(
      {super.key,
      this.height,
      this.width,
      required this.image,
      required this.title,
      required this.index});
  final double? height, width;

  final String image, title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GlobalCustomAnimationWidget(
      isHorizontal: true,
      index: index,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12.r),
          topRight: Radius.circular(AppSize.s12.r),
        ),
        child: Stack(
          children: [
            SvgPicture.asset(
              AssetsManager.noData,
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width,
              height: height ?? AppSize.s90.h,
            ),
            Image.network(
                fit: BoxFit.fill,
                width: MediaQuery.sizeOf(context).width,
                height: height ?? AppSize.s90.h,
                image),
          ],
        ),
      ),
    );
  }
}
