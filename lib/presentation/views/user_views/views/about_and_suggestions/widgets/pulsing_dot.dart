// ─── PULSING DOT ──────────────────────────────────────────
import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors_manager.dart';

class PulsingDot extends StatefulWidget {
  @override
  State<PulsingDot> createState() => PulsingDotState();
}

class PulsingDotState extends State<PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController c;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    c = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..repeat(reverse: true);
    scale = Tween(begin: 0.8, end: 1.2)
        .animate(CurvedAnimation(parent: c, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
