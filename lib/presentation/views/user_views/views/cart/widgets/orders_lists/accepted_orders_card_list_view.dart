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
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/no_data.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/constants.dart';

class DeliveryAcceptedOrdersCardListView extends StatelessWidget {
  const DeliveryAcceptedOrdersCardListView({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchAcceptOrdersCubit>(
      create: (context) => FetchAcceptOrdersCubit(
          UserFetchAcceptedOrdersUseCase(
            getIt.get<CartRepoImpl>(),
          ),
         )
        ..fetchAcceptedOrders(phoneNumber: phoneNumber),
      child: BlocBuilder<FetchAcceptOrdersCubit,
          FetchAcceptOrdersStates>(
        builder: (context, state) {
          var cubit = FetchAcceptOrdersCubit.get(context);

          if (state is FetchAcceptedOrdersSuccessState) {
            return state.acceptedOrders.isEmpty
                ? NoData()
                : RefreshIndicator(
                    color: ColorManager.primary,
                    onRefresh: () async {
                      await clearHiveBox<OrderEntity>(boxName: kAcceptedOrdersBox);
                      cubit.fetchAcceptedOrders(phoneNumber: phoneNumber);
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return CartOrderCard(
                              cartOrderCardModel: CartOrderCardModel(
                                orderEntity:  state.acceptedOrders[index],
                                deliveryStatus: "المقبوله",
                                actionButtonTitle: "ملخص الطلب",
                                backButtonTitle: "مسح",
                                deliveryStatusColor: ColorManager.primary,
                                onActionButtonTap: (){
                                  Navigator.pushNamed(
                                      context, Routes.orderSummaryRoute,
                                      arguments:
                                      state.acceptedOrders[index]);
                                },
                                statusColor:ColorManager.lightSecondary
                              ),
                            );
                          }, childCount: state.acceptedOrders.length),
                          
                        ),
                      ],
                    ),
                  );
           
          } else if (state is FetchAcceptedOrdersFailureState) {
            return Text(state.errorMsg);
          } else {
            return Center(child: GlobalLoadingIndicator());
          }
        },
      ),
    );
  }
}
