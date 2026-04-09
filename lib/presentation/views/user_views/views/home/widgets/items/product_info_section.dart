import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/data/models/product_model.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoSection extends StatefulWidget {
  const ProductInfoSection({super.key, required this.product});

  final HomeShopProductEntity product;

  @override
  State<ProductInfoSection> createState() => _ProductInfoSectionState();
}

class _ProductInfoSectionState extends State<ProductInfoSection> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        return SizedBox(
          width: AppSize.s200.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.product.productName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: ColorManager.primary),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.product.productDescription,
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "\$${widget.product.productPrice}",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: ColorManager.black),
              ),
              Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: quantity == 0
                          ? () {}
                          : () {
                              setState(() {
                                quantity--;
                              });
                              CartCubit.get(context)
                                  .decrementQuantity(widget.product);
                            }),
                  Text('$quantity'),
                  IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                        CartCubit.get(context)
                          ..incrementQuantity(widget.product);
                      }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
