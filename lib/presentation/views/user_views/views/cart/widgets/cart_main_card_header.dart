

import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartMainCardHeader extends StatelessWidget {
  const CartMainCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return   GlobalDecoratedContainer(
      child: ListTile(
        title: Text(
          "طلب من",
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: ColorManager.secondaryTextColor),
        ),
        subtitle: Text(
          "Ibn Elbalad",
          style:
          Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: ColorManager.primary,
          ),
        ),
        trailing: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: AppSize.s15.r,
            backgroundColor: ColorManager.primary,
            child: Icon(
              Icons.add,
              color: ColorManager.white,
              size: AppSize.s20.r,
            ),
          ),
        ),
        leading: CircleAvatar(
          radius: AppSize.s25.r,
          backgroundImage: const AssetImage(
            AssetsManager.shopTest,
          ),
        ),
      ),
    );
  }
}
