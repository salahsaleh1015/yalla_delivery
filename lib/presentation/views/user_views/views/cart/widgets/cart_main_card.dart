import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_main_card_body.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_main_card_header.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_dialogs/delete_order_dialog.dart';
import '../../../../global_widgets/global_light_button_widget.dart';
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




