
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';


class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          Text(
            "بتسجيلك، فإنك توافق على",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ,
            textAlign: TextAlign.center,
          ),
          Text(
            " شروط الخدمة وسياستنا للخصوصية.",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.primary)
            ,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
