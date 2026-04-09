// ─── FEEDBACK CARD ────────────────────────────────────────
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors_manager.dart';

class FeedbackCard extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final double cardPadding;
  final double titleFontSize;
  final double bodyFontSize;
  final int maxLines;

  const FeedbackCard({
    required this.controller,
    required this.focusNode,
    required this.cardPadding,
    required this.titleFontSize,
    required this.bodyFontSize,
    required this.maxLines,
  });

  @override
  State<FeedbackCard> createState() => FeedbackCardState();
}

class FeedbackCardState extends State<FeedbackCard> {
  bool _isFocused = false;
  bool _isButtonEnabled = false;
  void _checkIfFieldsAreFilled() {
    final isFilled = widget.controller.text.isNotEmpty;

    setState(() {
      _isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_checkIfFieldsAreFilled);
    widget.focusNode.addListener(() {
      if (mounted) setState(() => _isFocused = widget.focusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Container(
      padding: EdgeInsets.all(widget.cardPadding),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "يسعدنا أن نسمع منك",
            style: TextStyle(
              fontSize: widget.titleFontSize,
              fontWeight: FontWeight.w600,
              color: ColorManager.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'تساعدنا اقتراحاتكم على النمو والتطور يومياً.',
            style: TextStyle(
              fontSize: widget.bodyFontSize - 1,
              color: ColorManager.secondaryTextColor,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),

          // ── Text Field ────────────────────────────────
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: ColorManager.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isFocused ? ColorManager.primary : Colors.grey.shade200,
                width: _isFocused ? 1.5 : 1.0,
              ),
            ),
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              maxLines: widget.maxLines,
              style: TextStyle(
                fontSize: widget.bodyFontSize,
                color: ColorManager.black,
              ),
              decoration: InputDecoration(
                hintText: 'تساعدنا اقتراحاتكم على النمو والتطور يوميا....',
                hintStyle: TextStyle(
                  fontSize: widget.bodyFontSize,
                  color: ColorManager.hintColor,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8, top: 12),
                  child: Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: _isFocused
                        ? ColorManager.primary
                        : ColorManager.hintColor,
                    size: isTablet ? 20 : 18,
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(0, 12, 14, 12),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // ── Send Button ───────────────────────────────
          SizedBox(
            width: double.infinity,
            child: GlobalButtonWidget(
              isButtonEnabled: _isButtonEnabled,
              width: double.infinity,
              onTap: () {
                if (widget.controller.text.trim().isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Thank you for your feedback!'),
                      backgroundColor: ColorManager.primary,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                  widget.controller.clear();
                  widget.focusNode.unfocus();
                }
              },

              text: 'إرسال الملاحظات',
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: ColorManager.primary,
              //   foregroundColor: Colors.white,
              //   elevation: 0,
              //   padding: EdgeInsets.symmetric(
              //       vertical: isTablet ? 16 : 14),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12)),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
