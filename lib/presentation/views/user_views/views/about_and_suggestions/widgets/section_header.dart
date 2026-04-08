// ─── SECTION HEADER ───────────────────────────────────────
import 'package:flutter/material.dart';

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
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}