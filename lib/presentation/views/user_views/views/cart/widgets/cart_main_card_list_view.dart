import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/repos/cart_repos/cart_repo_impl.dart';
import 'package:delivery_app/domain/usecases/cart_usecases/get_user_orders_by_phone_number_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/cart_get_orders_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/cart_get_orders_state.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/no_data.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/views/cart_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_main_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

class CartMainCardListView extends StatelessWidget {
  const CartMainCardListView({super.key, required this.userPhoneNumber});

  final String userPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartGetOrdersCubit>(
      create: (context) => CartGetOrdersCubit(
          GetUserOrdersByPhoneNumberUseCase(getIt.get<CartRepoImpl>()))
        ..getOrders(userPhoneNumber: userPhoneNumber),
      child: BlocBuilder<CartGetOrdersCubit, CartGetOrdersStates>(
        builder: (context, state) {
          if (state is CartGetOrdersLoadingState) {
            return Center(
              child: GlobalLoadingIndicator(),
            );
          } else if (state is CartGetOrderSuccessState) {
            return state.orders.isEmpty? NoData() : SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) =>  CartMainCard(
                  order: state.orders[index],
                ),
              ),
            );
          } else {
            return ErrorState();
          }
        },
      ),
    );
  }
}
