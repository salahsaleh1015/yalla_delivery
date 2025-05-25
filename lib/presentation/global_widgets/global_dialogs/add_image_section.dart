
import 'package:delivery_app/presentation/global_widgets/global_add_image_button.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/values_manager.dart';

class AddImageSection extends StatelessWidget {
  const AddImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s100.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorManager.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
      child: const Center(

        child: GlobalAddImageButton(),
      ),
    );
  }
}

