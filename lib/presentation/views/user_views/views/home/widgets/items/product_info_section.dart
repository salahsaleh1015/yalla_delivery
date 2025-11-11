
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../models/product_model.dart';




class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s200.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            product.productName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: ColorManager.primary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.productDescription,
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "\$${product.productPrice}",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.black),
          ),
        ],
      ),
    );
  }
}