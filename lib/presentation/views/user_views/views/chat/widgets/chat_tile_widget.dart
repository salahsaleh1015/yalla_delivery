

import 'package:delivery_app/presentation/views/global_widgets/global_app_bar.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_button_widget.dart';
import '../../../../global_widgets/global_dialogs/confirm_order_dialog.dart';
import '../../../../global_widgets/global_divider_widget.dart';
import '../../../../global_widgets/global_rrder_details_widget.dart';
import '../../home/widgets/items/edit_location_card_item_widget.dart';
import '../../home/widgets/items/notes_section_item_widget.dart';
import '../../home/widgets/items/summary_delivery_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChatTileWidget extends StatelessWidget {
  const ChatTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(

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
                      "محمد سعيد",
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "9:00 م",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: ColorManager.primary),
                  ),
                  SizedBox(
                    height: AppSize.s5.h,
                  ),
                  CircleAvatar(
                      backgroundColor: ColorManager.primary,
                      radius: AppSize.s12.r,
                      child: Center(
                        child: Text(
                          "2",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: ColorManager.white),
                        ),
                      ))
                ],
              )
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

    );
  }
}
