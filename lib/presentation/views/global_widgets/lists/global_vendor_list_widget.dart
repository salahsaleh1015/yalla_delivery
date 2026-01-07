import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/data/models/shop_model.dart';

import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_vendor_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/routes_manager.dart';
import '../../../view_models/user_view_models/home_cubits/shops_cubit/shops_cubit.dart';

class GlobalVendorListWidget extends StatelessWidget {
  const GlobalVendorListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopsCubit>(
      create: (context) => ShopsCubit()..getAllShops(),
      child: BlocBuilder<ShopsCubit, ShopsStates>(
        builder: (context, state) {
          var cubit = ShopsCubit.get(context);
          if (state is GetShopsLoadingState) {
            return const Center(
              child: GlobalLoadingIndicator(),
            );
          } else if (state is GetShopsErrorState) {
            return Center(
              child: Text(
                // "حدث خطا من فضلك حاول مرة اخرى",
                state.errorMessage,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          } else {
            return SizedBox(
              width: double.infinity,
              height: AppSize.s408.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: AppSize.s10.w,
                ),
                itemCount: cubit.shopsList.length,
                itemBuilder: (context, index) {
                  var shop = ShopModel(
                    shopId:  cubit.shopsList[index].shopId,
                      shopName: cubit.shopsList[index].shopName,
                      shopAddress: cubit.shopsList[index].shopAddress,
                      shopPhoneNumber: cubit.shopsList[index].shopPhoneNumber,
                      shopImage: AssetsManager.shopTest,
                      shopRate: cubit.shopsList[index].shopRate);
                 return GlobalVendorItemWidget(

                  shop: cubit.shopsList[index],
                  onTap: () {
                    Navigator.pushNamed(context, Routes.shopDetailsRoute,
                        arguments:
                           cubit.shopsList[index]
                        );
                  },
                );
                  }
              ),
            );
          }
        },
      ),
    );
  }
}
