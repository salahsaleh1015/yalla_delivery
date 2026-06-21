
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GlobalCircularButtonWidget(
          onTap: () {
            Navigator.pop(context);
          },
          icon: Icons.arrow_back,
        ),
        Text(
          "طلباتي",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          width: AppSize.s30.w,
        ),

      ],
    );
  }
}
