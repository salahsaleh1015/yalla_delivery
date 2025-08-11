import 'package:delivery_app/presentation/views/user_views/views/chat/views/chat_messages_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

import '../../../../global_widgets/global_divider_widget.dart';

class ChatTileWidget extends StatelessWidget {
  const ChatTileWidget(
      {super.key,
      required this.deliveryName,
      required this.deliveryPhoneNumber});

  final String deliveryName;
  final String deliveryPhoneNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.userChatMessageRoute,
            arguments: ChatModel(phoneNumber: deliveryPhoneNumber, deliveryName: deliveryName));
      },
      child: SizedBox(
        height: AppSize.s70.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  AssetsManager.deliveryAvatar,
                  fit: BoxFit.fill,
                  width: AppSize.s50.w,
                  height: AppSize.s50.h,
                ),
                SizedBox(
                  width: AppSize.s10.w,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.57,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        deliveryName,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: ColorManager.black),
                      ),
                      Text(
                        "تحت أمرك! لو في حاجة تانية عايزها في....",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                const SizedBox(),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Text(
                //       "9:00 م",
                //       style: Theme.of(context)
                //           .textTheme
                //           .headlineSmall!
                //           .copyWith(color: ColorManager.primary),
                //     ),
                //     SizedBox(
                //       height: AppSize.s5.h,
                //     ),
                //     CircleAvatar(
                //         backgroundColor: ColorManager.primary,
                //         radius: AppSize.s12.r,
                //         child: Center(
                //           child: Text(
                //             "2",
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .headlineSmall!
                //                 .copyWith(color: ColorManager.white),
                //           ),
                //         ))
                //   ],
                // )
              ],
            ),
            SizedBox(
              height: AppSize.s5.h,
            ),
            GlobalDividerWidget(
              color: ColorManager.secondaryTextColor,
            ),
            SizedBox(
              height: AppSize.s5.h,
            )
          ],
        ),
      ),
    );
  }
}
