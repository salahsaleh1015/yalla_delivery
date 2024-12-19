
import 'package:delivery_app/features/cart/views/cart_view.dart';
import 'package:delivery_app/features/cart/widgets/cart_main_card_body.dart';
import 'package:delivery_app/features/cart/widgets/cart_main_card_header.dart';
import 'package:delivery_app/features/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class CartMainCard extends StatelessWidget {
  const CartMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p10,
      ),
      child: GlobalDecoratedContainer(
          child: Column(
            children: [
              const CartMainCardHeader(),
              SizedBox(
                height: AppSize.s10.h,
              ),
              const CartMainCardBody(),
            ],
          )),
    );
  }
}




