import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ResendVerificationText extends StatefulWidget {
  const ResendVerificationText({super.key});

  @override
  State<ResendVerificationText> createState() => _ResendVerificationTextState();
}

class _ResendVerificationTextState extends State<ResendVerificationText> {
  final TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.s10.w, vertical: AppSize.s10.h),
      child: RichText(
        text:
            TextSpan(style: Theme.of(context).textTheme.labelSmall, children: [
          const TextSpan(
            text: "لم تستلم رمزك؟ ",
          ),
          TextSpan(
            recognizer: _tapRecognizer
              ..onTap = () {
                // Your action here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('TextSpan clicked!')),
                );
              },
            text: "أعد إرساله",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.primary),
          ),
          const TextSpan(
            text: " خلال (",
          ),
          TextSpan(
            text: "35 ثانية",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: ColorManager.primary,
                ),
          ),
          const TextSpan(
            text: ").",
          ),
        ]),
      ),
    );
  }


  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }
}

