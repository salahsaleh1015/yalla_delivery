// ─── ANIMATED FEEDBACK SECTION ────────────────────────────
import 'package:delivery_app/presentation/views/user_views/views/about_and_suggestions/widgets/feedback_card.dart';
import 'package:delivery_app/presentation/views/user_views/views/about_and_suggestions/widgets/section_header.dart';
import 'package:flutter/material.dart';

class AnimatedFeedbackSection extends StatelessWidget {
  final Animation<double> animation;
  final FocusNode titleFocusNode;
  final FocusNode feedbackFocusNode;
  final double cardPadding;
  final double titleFontSize;
  final double bodyFontSize;
  final int textFieldMaxLines;

  const AnimatedFeedbackSection({
    required this.animation,
    required this.feedbackFocusNode,
    required this.titleFocusNode,
    required this.cardPadding,
    required this.titleFontSize,
    required this.bodyFontSize,
    required this.textFieldMaxLines,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(label: 'ملاحظاتك'),
            const SizedBox(height: 12),
            FeedbackCard(


              titleFocusNode: titleFocusNode,
              feedbackFocusNode: feedbackFocusNode,
              cardPadding: cardPadding,
              titleFontSize: titleFontSize,
              bodyFontSize: bodyFontSize,
              maxLines: textFieldMaxLines,
            ),
          ],
        ),
      ),
    );
  }
}