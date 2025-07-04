
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DeliveryNoteCard extends StatelessWidget {
  const DeliveryNoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  GlobalDecoratedContainer(
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.p8.h, horizontal: AppPadding.p16.w),
      child: Row(
        children: [
          Icon(
            Icons.edit,
            color: ColorManager.black,
          ),
          SizedBox(
            width: AppSize.s10.w,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                  "هاتلي برشامة صداع من صيدلية العزبي وانت جاي هاتلي برشامة صداع من صيدلية العزبي وانت جاي "))
        ],
      ),
    );
  }
}