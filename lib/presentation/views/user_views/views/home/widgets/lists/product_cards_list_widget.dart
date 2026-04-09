import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/repos/home_repo/home_repo_impl.dart';
import 'package:delivery_app/domain/usecases/home_usecases/home_get_shop_products_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_state.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/home_cubits/get_shop_products_cubit/get_shop_products_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/no_data.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/widgets/items/product_card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/resources/routes_manager.dart';
import '../../../../../../view_models/user_view_models/cart_cubit/cart_cubit.dart';
import '../../../../../../view_models/user_view_models/home_cubits/get_shop_products_cubit/get_shop_products_state.dart';
import '../../../../../global_widgets/global_loading_indicator.dart';

class ProductCardsListWidget extends StatelessWidget {
  const ProductCardsListWidget({super.key, required this.shopId});

  final String shopId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetShopProductsCubit>(
          create: (context) => GetShopProductsCubit(
            HomeGetShopProductsUseCase(getIt.get<HomeRepoImpl>()),
          )..fetchShopProducts(shopId: shopId),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
      ],
      child: BlocBuilder<GetShopProductsCubit, GetShopProductsStates>(
        builder: (context, state) {
          if (state is GetShopProductsLoadingState) {
            return const Center(child: GlobalLoadingIndicator());
          }
          if (state is GetShopProductsErrorState) {
            return Center(child: Text("حدث خطأ ما حاول مره اخرى"));
          } else if (state is GetShopProductsLoadedState) {
            return state.shopProductsList.isNotEmpty
                ? Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                            itemCount: state.shopProductsList.length,
                            itemBuilder: (context, index) => ProductCardItemWidget(
                                  index: index,
                                  product: state.shopProductsList[index],
                                ))),
                    _buildCheckoutButton(context),
                  ],
                )
                : const NoData();
          } else {
            return const NoData();
            ;
          }
        },
      ),
    );
  }
  Widget _buildCheckoutButton(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cartCubit = CartCubit.get(context);
        return ElevatedButton(
          onPressed: cartCubit.selectedProducts.isEmpty
              ? null
              : () {
            Navigator.pushNamed(
                context, Routes.chooseDeliveryFromAddOrderRoute,
                arguments: cartCubit.getSelectedProductsAsString(),);

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => NextPage(
            //       // ✅ هنا بنبعت القيمتين للصفحة الجاية
            //       productsString: cartCubit.getSelectedProductsAsString(),
            //       totalPrice: cartCubit.getTotalPrice(),
            //     ),
            //   ),
            // );
          },
          child: Text('متابعة (${cartCubit.getTotalPrice()} جنيه)'),
        );
      },
    );
  }
}
