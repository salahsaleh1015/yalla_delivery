// ─── ANIMATED ABOUT CARD ──────────────────────────────────
import 'package:delivery_app/data/models/about_item.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors_manager.dart';

class AnimatedAboutCard extends StatelessWidget {
  final Animation<double> animation;
  final AboutItem item;
  final double cardPadding;
  final double iconContainerSize;
  final double iconSize;
  final double titleFontSize;
  final double bodyFontSize;

  const AnimatedAboutCard({
    required this.animation,
    required this.item,
    required this.cardPadding,
    required this.iconContainerSize,
    required this.iconSize,
    required this.titleFontSize,
    required this.bodyFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(animation),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _AboutCard(
            item: item,
            cardPadding: cardPadding,
            iconContainerSize: iconContainerSize,
            iconSize: iconSize,
            titleFontSize: titleFontSize,
            bodyFontSize: bodyFontSize,
          ),
        ),
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final AboutItem item;
  final double cardPadding;
  final double iconContainerSize;
  final double iconSize;
  final double titleFontSize;
  final double bodyFontSize;

  const _AboutCard({
    required this.item,
    required this.cardPadding,
    required this.iconContainerSize,
    required this.iconSize,
    required this.titleFontSize,
    required this.bodyFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: iconContainerSize,
            height: iconContainerSize,
            decoration: BoxDecoration(
              color: ColorManager.lightSecondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, color: ColorManager.primary, size: iconSize),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: bodyFontSize,
                    color: ColorManager.secondaryTextColor,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}