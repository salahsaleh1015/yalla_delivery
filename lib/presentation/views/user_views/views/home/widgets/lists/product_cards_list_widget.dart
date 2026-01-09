import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/repos/home_repo/home_repo_impl.dart';
import 'package:delivery_app/domain/usecases/home_usecases/home_get_shop_products_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/home_cubits/get_shop_products_cubit/get_shop_products_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/no_data.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/widgets/items/product_card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../view_models/user_view_models/home_cubits/get_shop_products_cubit/get_shop_products_state.dart';
import '../../../../../global_widgets/global_loading_indicator.dart';

class ProductCardsListWidget extends StatelessWidget {
  const ProductCardsListWidget({super.key, required this.shopId});

  final String shopId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetShopProductsCubit>(
      create: (context) => GetShopProductsCubit(
        HomeGetShopProductsUseCase(getIt.get<HomeRepoImpl>()),
      )..fetchShopProducts(shopId: shopId),
      child: BlocBuilder<GetShopProductsCubit, GetShopProductsStates>(
        builder: (context, state) {
          var cubit = GetShopProductsCubit.get(context);
          if (state is GetShopProductsLoadingState) {
            return const Center(child: GlobalLoadingIndicator());
          }
          if (state is GetShopProductsErrorState) {
            return Center(child: Text("حدث خطأ ما حاول مره اخرى"));
          } else if (state is GetShopProductsLoadedState) {
            return state.shopProductsList.isNotEmpty
                ? SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        itemCount: state.shopProductsList.length,
                        itemBuilder: (context, index) => ProductCardItemWidget(
                              product: state.shopProductsList[index],
                            )))
                : const NoData();
          } else {
            return const NoData();
            ;
          }
        },
      ),
    );
  }
}
