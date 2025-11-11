import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/presentation/models/product_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/home_cubits/shops_cubit/shops_cubit.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/widgets/items/product_card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../global_widgets/global_loading_indicator.dart';

class ProductCardsListWidget extends StatelessWidget {
  const ProductCardsListWidget({super.key, required this.shopId});

  final String shopId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopsCubit>(
      create: (context) =>
          ShopsCubit()..getShopsProductsByShopId(shopId: shopId),
      child: BlocBuilder<ShopsCubit, ShopsStates>(
        builder: (context, state) {
          var cubit = ShopsCubit.get(context);
          if (state is GetShopProductsLoadingState) {
            return const Center(child: GlobalLoadingIndicator());
          }
          if (state is GetShopProductsErrorState) {
            return Center(child: Text(state.errorMessage));
          } else {
          return  cubit.shopProductsList.isNotEmpty
                ? SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        itemCount: cubit.shopProductsList.length,
                        itemBuilder: (context, index) => ProductCardItemWidget(
                              product:cubit.shopProductsList[index],
                            )))
                : const Text("لا يوجد منتجات");
          }

        },
      ),
    );
  }
}
