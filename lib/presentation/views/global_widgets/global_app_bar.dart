
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar(
      {super.key,
      required this.title,
      this.onTap,});

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
     GlobalCircularButtonWidget(
                onTap: onTap ??
                    () {
                      Navigator.pop(context);
                    },
                icon: Icons.arrow_back,
              ),

        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
       SizedBox(width: AppSize.s30.w,)
       // GlobalCircularButtonWidget(
       //          onTap: () {
       //            Navigator.pushNamed(context, CartView.id);
       //          },
       //          icon: Icons.shopping_cart_outlined,
       //        )
       //    ,

      ],
    );
  }
}
