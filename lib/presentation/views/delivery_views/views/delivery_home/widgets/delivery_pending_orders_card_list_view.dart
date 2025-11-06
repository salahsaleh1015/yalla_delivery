import 'package:delivery_app/presentation/views/delivery_views/views/delivery_home/widgets/delivery_order_card.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../view_models/delivery_view_models/delivery_orders_cubit/delivery_orders_cubit.dart';

class DeliveryPendingOrdersCardListView extends StatelessWidget {
  const DeliveryPendingOrdersCardListView({super.key, required this.deliveryMail,});

  final String deliveryMail;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryOrdersCubit>(
      create: (context) => DeliveryOrdersCubit()
        ..getDeliveryPendingOrdersByGmail(gMail: deliveryMail),
      child: BlocConsumer<DeliveryOrdersCubit, DeliveryOrdersStates>(
        listener: (context, state) {
          if (state is DeliveryEditOrderStatusSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 3),
                backgroundColor: ColorManager.black,
                content: const Text('تم التعديل بنجاح'),
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = DeliveryOrdersCubit.get(context);
          var orders = cubit.pendingOrdersList;
          if (state is DeliveryGetPendingOrdersLoadingState ||
              state is DeliveryEditOrderStatusLoadingState) {
            return const SliverToBoxAdapter(
              child: Center(
                child: GlobalLoadingIndicator(),
              ),
            );
          } else if (state is DeliveryGetPendingOrdersErrorState) {
            return const SliverToBoxAdapter(
                child: Text("حدث خطأ ما حاول في وقت لاحق"));
          } else {
            return cubit.pendingOrdersList.isEmpty
                ? const SliverToBoxAdapter(child: NoData())
                : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final order = orders[index];
                      return DeliveryOrderCard(
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
