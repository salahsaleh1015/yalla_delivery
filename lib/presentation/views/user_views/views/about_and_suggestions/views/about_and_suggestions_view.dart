import 'package:delivery_app/presentation/views/user_views/views/about_and_suggestions/widgets/animated_about_card.dart';
import 'package:delivery_app/presentation/views/user_views/views/about_and_suggestions/widgets/or_divider.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../data/models/about_item.dart';
import '../widgets/animated_feedback_section.dart';
import '../widgets/pulsing_dot.dart';
import '../widgets/section_header.dart';


// ─── MAIN VIEW ────────────────────────────────────────────
class AboutAndFeedbackView extends StatefulWidget {
  const AboutAndFeedbackView({super.key});

  @override
  State<AboutAndFeedbackView> createState() => AboutAndFeedbackViewState();
}

class AboutAndFeedbackViewState extends State<AboutAndFeedbackView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _feedbackController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List<AboutItem> _aboutItems = const [
    AboutItem(
      Icons.layers_rounded,
      'مهمتنا',
      "مهمتنا هي الوصول لافضل خدمه للعميل و وصول كل طلباتك في اسرع وقت",
    ),
    AboutItem(
      Icons.people_alt_rounded,
      'الفريق',
      'فريق من المحترفين المتحمسين ملتزمون ببناء أفضل تجربة بإبداع وإخلاص.',
    ),
    AboutItem(
      Icons.history_rounded,
      'قصتنا',
      'تأسست شركتنا برؤية لإحداث تغيير إيجابي، ورحلتنا هي رحلة نمو ومرونة وشغف.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _feedbackController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Animation<double> _staggered(int index,
      {double start = 0.0, double end = 1.0}) {
    return CurvedAnimation(
      parent: _controller,
      curve: Interval(
        (start + index * 0.12).clamp(0.0, 0.85),
        (end + index * 0.12).clamp(0.0, 1.0),
        curve: Curves.easeOutBack,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 900;

    // ── Responsive values ──────────────────────────────────
    final double maxContentWidth = isDesktop ? 720 : isTablet ? 600 : double.infinity;
    final double horizontalPadding = isDesktop ? 32 : isTablet ? 24 : 16;
    final double cardPadding = isTablet ? 22 : 18;
    final double iconContainerSize = isTablet ? 50 : 42;
    final double iconSize = isTablet ? 24 : 20;
    final double titleFontSize = isTablet ? 16 : 14;
    final double bodyFontSize = isTablet ? 14 : 13;
    final int textFieldMaxLines = isTablet ? 7 : 5;

    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackgroundColor,
      // appBar: _buildAppBar(context, isTablet: isTablet),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── About Us Section ────────────────────────
                const SectionHeader(label: 'من نحن'),
                const SizedBox(height: 12),
                ..._aboutItems.asMap().entries.map(
                      (e) => AnimatedAboutCard(
                    animation: _staggered(e.key, start: 0.05),
                    item: e.value,
                    cardPadding: cardPadding,
                    iconContainerSize: iconContainerSize,
                    iconSize: iconSize,
                    titleFontSize: titleFontSize,
                    bodyFontSize: bodyFontSize,
                  ),
                ),

                const SizedBox(height: 20),
                const OrDivider(),
                const SizedBox(height: 20),

                // ── Feedback Section ────────────────────────
                AnimatedFeedbackSection(
                  animation: _staggered(3, start: 0.4),
                  feedbackController: _feedbackController,
                  focusNode: _focusNode,
                  cardPadding: cardPadding,
                  titleFontSize: titleFontSize,
                  bodyFontSize: bodyFontSize,
                  textFieldMaxLines: textFieldMaxLines,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

}






// ─── DIVIDER ──────────────────────────────────────────────



