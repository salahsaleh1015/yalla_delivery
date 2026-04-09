// ─── SECTION HEADER ───────────────────────────────────────
import 'package:delivery_app/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_manager.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  const SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return Row(
      children: [
        Container(
          width: 3,
          height: isTablet ? 24 : 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorManager.primary, ColorManager.lightPrimary],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: FontSize.s20.sp,
          ),
        ),
      ],
    );
  }
}