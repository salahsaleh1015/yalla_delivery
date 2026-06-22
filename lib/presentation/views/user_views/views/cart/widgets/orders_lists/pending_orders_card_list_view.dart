
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/core/utils/functions/hive_functions.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/models/cart_order_card_model.dart';
import 'package:delivery_app/data/repos/cart_repos/cart_repo_impl.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/domain/usecases/cart_usecases/user_fetch_accepted_orders_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_accept_orders_cubit/fetch_accept_orders_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_accept_orders_cubit/fetch_accept_orders_state.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_pending_orders_cubit/fetch_pending_orders_state.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/no_data.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/views/cart_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/constants.dart';
import '../../../../../../../domain/usecases/cart_usecases/user_fetch_pending_orders_usecase.dart';
import '../../../../../../view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_pending_orders_cubit/fetch_pending_orders_cubit.dart';

class DeliveryPendingOrdersCardListView extends StatelessWidget {
  const DeliveryPendingOrdersCardListView({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchPendingOrdersCubit>(
      create: (context) => FetchPendingOrdersCubit(
        UserFetchPendingOrdersUseCase(
          getIt.get<CartRepoImpl>(),
        ),
      )
        ..fetchPendingOrders(phoneNumber: phoneNumber),
      child: BlocBuilder<FetchPendingOrdersCubit,
          FetchPendingOrdersStates>(
        builder: (context, state) {
          var cubit = FetchPendingOrdersCubit.get(context);

          if (state is FetchPendingOrdersSuccessState) {
            return state.pendingOrders.isEmpty
                ? NoData()
                : RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () async {
                await clearHiveBox<OrderEntity>(boxName: kPendingOrdersBox);
                cubit.fetchPendingOrders(phoneNumber: phoneNumber);
              },
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate:
                    SliverChildBuilderDelegate((context, index) {
                      return CartOrderCard(
                        cartOrderCardModel: CartOrderCardModel(
                          orderEntity:  state.pendingOrders[index],
                            deliveryStatus: "المعلقه",
                            actionButtonTitle: "ملخص الطلب",
                            backButtonTitle: "مسح",
                            deliveryStatusColor: ColorManager.darkGrayColor,
                            onActionButtonTap: (){
                              Navigator.pushNamed(
                                  context, Routes.cartSummaryRoute,
                                  arguments:
                                  state.pendingOrders[index]);
                            },
                            statusColor:ColorManager.lightGrayColor
                        ),
                      );
                    }, childCount: state.pendingOrders.length),

                  ),
                ],
              ),
            );

          } else if (state is FetchPendingOrdersFailureState) {
            return ErrorState();
          } else {
            return Center(child: GlobalLoadingIndicator());
          }
        },
      ),
    );
  }
}
