// import 'package:delivery_app/core/resources/assets_manager.dart';
// import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
// import 'package:delivery_app/data/repos/home_repo/home_repo_impl.dart';
// import 'package:delivery_app/domain/usecases/home_usecases/home_get_shop_products_usecase.dart';
// import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_state.dart';
// import 'package:delivery_app/presentation/view_models/user_view_models/home_cubits/get_shop_products_cubit/get_shop_products_cubit.dart';
// import 'package:delivery_app/presentation/views/global_widgets/no_data.dart';
// import 'package:delivery_app/presentation/views/user_views/views/home/widgets/items/product_card_item_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../../../core/resources/colors_manager.dart';
// import '../../../../../../../core/resources/routes_manager.dart';
// import '../../../../../../view_models/user_view_models/cart_cubit/cart_cubit.dart';
// import '../../../../../../view_models/user_view_models/home_cubits/get_shop_products_cubit/get_shop_products_state.dart';
// import '../../../../../global_widgets/global_loading_indicator.dart';
//
// class ProductCardsListWidget extends StatelessWidget {
//   const ProductCardsListWidget({super.key, required this.shopId});
//
//   final String shopId;
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<GetShopProductsCubit>(
//           create: (context) => GetShopProductsCubit(
//             HomeGetShopProductsUseCase(getIt.get<HomeRepoImpl>()),
//           )..fetchShopProducts(shopId: shopId),
//         ),
//         BlocProvider<CartCubit>(
//           create: (context) => CartCubit(),
//         ),
//       ],
//       child: BlocBuilder<GetShopProductsCubit, GetShopProductsStates>(
//         builder: (context, state) {
//           if (state is GetShopProductsLoadingState) {
//             return const Center(child: GlobalLoadingIndicator());
//           }
//           if (state is GetShopProductsErrorState) {
//             return Center(child: Text("حدث خطأ ما حاول مره اخرى"));
//           } else if (state is GetShopProductsLoadedState) {
//             return state.shopProductsList.isNotEmpty
//                 ? Column(
//                   children: [
//             SizedBox(
//
//                         width: double.infinity,
//                         height: MediaQuery.of(context).size.height * 0.4,
//                         child: ListView.builder(
//                             itemCount: state.shopProductsList.length,
//                             itemBuilder: (context, index) => ProductCardItemWidget(
//                                   index: index,
//                                   product: state.shopProductsList[index],
//                                 ))),
//                     SizedBox(
//                       height: 25,
//                     ),
//                   //  _buildCheckoutButton(context),
//                   ],
//                 )
//                 : const NoData();
//           } else {
//             return const NoData();
//             ;
//           }
//         },
//       ),
//     );
//   }
//   Widget _buildCheckoutButton(BuildContext context) {
//     return BlocBuilder<CartCubit, CartStates>(
//       builder: (context, state) {
//         var cartCubit = CartCubit.get(context);
//         bool isEmpty = cartCubit.selectedProducts.isEmpty;
//
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: ElevatedButton(
//             onPressed: isEmpty
//                 ? null
//                 : () {
//               Navigator.pushNamed(
//                 context,
//                 Routes.chooseDeliveryFromAddOrderRoute,
//                 arguments: cartCubit.getSelectedProductsAsString(),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               // ✅ لو فاضي يبقى رمادي، لو فيه منتجات يبقى primary
//               backgroundColor: isEmpty
//                   ? ColorManager.lightGrayColor
//                   : ColorManager.primary,
//               disabledBackgroundColor: ColorManager.lightGrayColor,
//               foregroundColor: ColorManager.white,
//               disabledForegroundColor: ColorManager.hintColor,
//               minimumSize: const Size(double.infinity, 52),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: isEmpty ? 0 : 3,
//               shadowColor: ColorManager.lightPrimary,
//             ),
//             child: Text(
//               isEmpty
//                   ? 'اختر منتجات أولاً'
//                   : 'متابعة (${cartCubit.getTotalPrice()} جنيه)',
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.bold,
//                 color: isEmpty ? ColorManager.hintColor : ColorManager.white,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/colors_manager.dart';
import '../../../../../../../core/resources/routes_manager.dart';
import '../../../../../../../core/resources/values_manager.dart';
import '../../../../../../view_models/user_view_models/cart_cubit/cart_cubit.dart';
import '../../../../../../view_models/user_view_models/home_cubits/get_shop_products_cubit/get_shop_products_state.dart';
import '../../../../../global_widgets/global_button_widget.dart';
import '../../../../../global_widgets/global_decorated_bottom_container.dart';
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
            return const Center(child: Text("حدث خطأ ما حاول مره اخرى"));
          } else if (state is GetShopProductsLoadedState) {
            return state.shopProductsList.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          // ✅ padding سفلي عشان اخر عنصر ميتغطاش من الزرار
                          padding: EdgeInsets.only(bottom: AppSize.s80.h),
                          itemCount: state.shopProductsList.length,
                          itemBuilder: (context, index) =>
                              ProductCardItemWidget(
                            index: index,
                            product: state.shopProductsList[index],
                          ),
                        ),
                      ),
                      // ✅ الزرار لازق في القاع طبيعي
                      _buildCheckoutBottomBar(context),
                    ],
                  )
                : const NoData();
          } else {
            return const NoData();
          }
        },
      ),
    );
  }

  Widget _buildCheckoutBottomBar(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cartCubit = CartCubit.get(context);
        bool isEmpty = cartCubit.selectedProducts.isEmpty;

        return GlobalDecoratedBottomContainer(
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p10.r),
            child: Row(
              children: [
                Text(
                  "السعر",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: ColorManager.primary),
                ),
                SizedBox(width: AppSize.s10.w),
                Text(
                  isEmpty ? "0 ج" : "${cartCubit.getTotalPrice()} ج",
                  style: Theme.of(context).textTheme.displayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                GlobalButtonWidget(
                  isButtonEnabled: !isEmpty,
                  text: isEmpty ? "اختر منتجات أولاً" : "استمر",
                  onTap: () {
                    if (!isEmpty) {
                      Navigator.pushNamed(
                        context,
                        Routes.chooseDeliveryFromAddOrderRoute,
                        arguments: cartCubit.getSelectedProductsAsString(),
                      );
                    }
                  },
                  width: AppSize.s180.w,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
