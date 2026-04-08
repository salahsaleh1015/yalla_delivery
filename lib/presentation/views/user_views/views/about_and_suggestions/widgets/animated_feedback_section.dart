// ─── ANIMATED FEEDBACK SECTION ────────────────────────────
import 'package:delivery_app/presentation/views/user_views/views/about_and_suggestions/widgets/feedback_card.dart';
import 'package:delivery_app/presentation/views/user_views/views/about_and_suggestions/widgets/section_header.dart';
import 'package:flutter/material.dart';

class AnimatedFeedbackSection extends StatelessWidget {
  final Animation<double> animation;
  final TextEditingController feedbackController;
  final FocusNode focusNode;
  final double cardPadding;
  final double titleFontSize;
  final double bodyFontSize;
  final int textFieldMaxLines;

  const AnimatedFeedbackSection({
    required this.animation,
    required this.feedbackController,
    required this.focusNode,
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
            const SectionHeader(label: 'Your Feedback'),
            const SizedBox(height: 12),
            FeedbackCard(
              controller: feedbackController,
              focusNode: focusNode,
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