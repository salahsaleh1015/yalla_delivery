import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/core/utils/functions/hive_functions.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/models/cart_order_card_model.dart';
import 'package:delivery_app/data/repos/cart_repos/cart_repo_impl.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/domain/usecases/cart_usecases/user_fetch_accepted_orders_usecase.dart';
import 'package:delivery_app/domain/usecases/cart_usecases/user_fetch_completed_orders_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_accept_orders_cubit/fetch_accept_orders_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_accept_orders_cubit/fetch_accept_orders_state.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_completed_orders_cubit/fetch_completed_orders_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_completed_orders_cubit/fetch_completed_orders_state.dart';
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

class DeliveryCompletedOrdersCardListView extends StatelessWidget {
  const DeliveryCompletedOrdersCardListView({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchCompletedOrdersCubit>(
      create: (context) => FetchCompletedOrdersCubit(
        UserFetchCompletedOrdersUseCase(
          getIt.get<CartRepoImpl>(),
        ),
      )..fetchCompletedOrders(phoneNumber: phoneNumber),
      child: BlocBuilder<FetchCompletedOrdersCubit, FetchCompletedOrdersStates>(
        builder: (context, state) {
          var cubit = FetchCompletedOrdersCubit.get(context);

          if (state is FetchCompleteOrdersSuccessState) {
            return state.completedOrders.isEmpty
                ? NoData()
                : RefreshIndicator(
                    color: ColorManager.primary,
                    onRefresh: () async {
                      await clearHiveBox<OrderEntity>(
                          boxName: kCompletedOrdersBox);
                      cubit.fetchCompletedOrders(phoneNumber: phoneNumber);
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return CartOrderCard(
                              cartOrderCardModel: CartOrderCardModel(
                                orderEntity:  state.completedOrders[index],
                                  deliveryStatus: "المكتمله",
                                  actionButtonTitle: "ملخص الطلب",
                                  backButtonTitle: "مسح",
                                  deliveryStatusColor: ColorManager.greenColor,
                                  onActionButtonTap: () {

                                    Navigator.pushNamed(
                                        context, Routes.orderSummaryRoute,
                                        arguments:
                                            state.completedOrders[index]);
                                  },
                                  statusColor: ColorManager.lightGreenColor),
                            );
                          }, childCount: state.completedOrders.length),
                        ),
                      ],
                    ),
                  );
          } else if (state is FetchCompleteOrdersFailureState) {
            return ErrorState();
          } else {
            return Center(child: GlobalLoadingIndicator());
          }
        },
      ),
    );
  }
}
