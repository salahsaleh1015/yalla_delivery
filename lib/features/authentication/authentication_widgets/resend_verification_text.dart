import 'package:delivery_app/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class ResendVerificationText extends StatelessWidget {
  const ResendVerificationText({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("لم تستلم رمزك؟",
            style: Theme.of(context).textTheme.labelSmall!),
        TextButton(
            onPressed: () {},
            child: Text(
              "أعد إرساله ",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: ColorManager.primary),
            )),
        Text("خلال",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.black)),
        Text("(",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.black)),
        Text(
          "35 ثانية ",
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: ColorManager.primary),
        ),
        Text(")",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.black)),
      ],
    );
  }
}
