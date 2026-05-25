import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_main_card_body.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_main_card_header.dart';

import '../../../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CartMainCard extends StatelessWidget {
  const CartMainCard({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p10,
      ),
      child: GlobalDecoratedContainer(
          child: Column(
            children: [
          //  const CartMainCardHeader(),
              SizedBox(
                height: AppSize.s10.h,
              ),
               CartMainCardBody(order: order,),
            ],
          )),
    );
  }
}




