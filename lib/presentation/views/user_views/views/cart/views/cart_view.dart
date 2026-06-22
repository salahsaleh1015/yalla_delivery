import 'package:delivery_app/core/services/firebase_services/firestore_user_info_services.dart';
import 'package:delivery_app/domain/usecases/cache_user_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_caching_cubit/user_caching_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_app_bar.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/order_management_tab_bar.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/orders_management_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/constants_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../injection.dart';
import '../../../../global_widgets/global_padding_widget.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCachingCubit>(
      create: (context) => UserCachingCubit(
          sl.get<CacheUserUseCase>(),
          sl.get<GetCachedUserUseCase>(),
          sl<UpdateCachedUserUseCase>(),
          sl<FirebaseUserServices>())
        ..loadCachedUser(),
      child: Scaffold(
        body: DefaultTabController(
          length: AppConstant.managementTabBarLength,
          child: GlobalPaddingWidget(
              child: Column(
            children: [
              const CartAppBar(),
              SizedBox(
                height: AppSize.s25.h,
              ),
              const OrderManagementTabBar(),
              SizedBox(
                height: AppSize.s25.h,
              ),
              BlocBuilder<UserCachingCubit, UserCachingStates>(
                  builder: (context, state) {
                if (state is UserCachingLoadingState) {
                  return const Center(
                    child: GlobalLoadingIndicator(),
                  );
                } else if (state is UserCachingLoadedState) {
                  var cachedUserModel = state.cachedUserModel;
                  return OrdersManagementTabBarView(
                    phoneNumber: UserCachingCubit.get(context)
                        .cachedUserModel
                        .phoneNumber,
                  );
                } else {
                  return Center(
                    child: Text(
                      "هناك خطأ ما حاول مره اخرى لاحقا",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                }
              }),
            ],
          )),
        ),
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  const ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "هناك خطأ ما حاول مره اخرى لاحقا",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
    ;
  }
}
