import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_home/widgets/delivery_delete_order_button2.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_home/widgets/delivery_order_card.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_order_management/widgets/delivery_order_summary_button.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_light_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../view_models/delivery_view_models/delivery_orders_cubit/delivery_orders_cubit.dart';

class DeliveryCompletedOrdersCardListView extends StatelessWidget {
  const DeliveryCompletedOrdersCardListView({
    super.key,
    required this.deliveryMail,
  });

  final String deliveryMail;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryOrdersCubit>(
      create: (context) => DeliveryOrdersCubit()
        ..getDeliveryCompletedOrdersByGmail(gMail: deliveryMail),
      child: BlocConsumer<DeliveryOrdersCubit, DeliveryOrdersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DeliveryOrdersCubit.get(context);
          var orders = cubit.completedOrdersList;
          if (state is DeliveryGetCompletedOrdersLoadingState) {
            return const SliverToBoxAdapter(
              child: Center(
                child: GlobalLoadingIndicator(),
              ),
            );
          } else if (state is DeliveryGetCompletedOrdersErrorState) {
            return const SliverToBoxAdapter(
                child: Center(child: Text("حدث خطأ ما حاول في وقت لاحق")));
          } else {
            return cubit.completedOrdersList.isEmpty
                ? const SliverToBoxAdapter(child: NoData())
                : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final order = orders[index];
                      return DeliveryOrderCard(
                        cardActionButtons: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DeliveryOrderSummaryButton(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.deliveryOrderSummaryRoute,arguments: order);
                              },
                            )
                          ],
                        ),
                        orderModel: order,
                      );
                    }, childCount: orders.length),
                  );
          }
        },
      ),
    );
  }
}
