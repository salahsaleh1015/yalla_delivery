import 'package:delivery_app/core/services/firebase_services/firestore_user_info_services.dart';
import 'package:delivery_app/domain/usecases/cache_user_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_caching_cubit/user_caching_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_pop_scope.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/views/cart_choose_delivery.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_app_bar.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../injection.dart';
import '../../../../global_widgets/global_padding_widget.dart';
import '../widgets/cart_main_card_list_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static String id = "CartView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCachingCubit>(
      create: (context) => UserCachingCubit(
          sl.get<CacheUserUseCase>(),
          sl.get<GetCachedUserUseCase>(),
          sl<UpdateCachedUserUseCase>(),
          sl<FirebaseUserServices>())
        ..loadCachedUser(),
      child: BlocBuilder<UserCachingCubit, UserCachingStates>(
        builder: (context, state) {
          if (state is UserCachingLoadingState) {
            return Center(
              child: GlobalLoadingIndicator(),
            );
          } else if (state is UserCachingLoadedState) {
            return Scaffold(
              body: GlobalPaddingWidget(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CartAppBar(),
                    SizedBox(
                      height: AppSize.s30.h,
                    ),
                    CartMainCardListView(
                      userPhoneNumber: UserCachingCubit.get(context)
                          .cachedUserModel
                          .phoneNumber,
                    ),
                  ],
                ),
              )),

            );
          } else {
            return ErrorState();
          }
        },
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
    );;
  }
}
