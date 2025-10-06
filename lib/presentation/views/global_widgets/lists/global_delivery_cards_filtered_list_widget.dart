import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_no_deliveries_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_something_wrong_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/delivery_cards_filtered_model.dart';
import '../../../view_models/user_view_models/delivery_in_user_cubit/delivery_in_user_cubit.dart';
import '../global_delivery_filtered_cards_widget.dart';

class GlobalDeliveryCardsFilteredListWidget extends StatelessWidget {
  const GlobalDeliveryCardsFilteredListWidget({
    super.key,
    required this.height,
    required this.deliveryStatus,
    required this.isSelected,
  });

  final double height;
  final String deliveryStatus;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryInUserCubit>(
      create: (context) => DeliveryInUserCubit()
        ..getAllDeliveriesByStatus(deliveryStatus: deliveryStatus),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: BlocBuilder<DeliveryInUserCubit, DeliveryInUserStates>(
          builder: (context, state) {
            var cubit = DeliveryInUserCubit.get(context);
            if (state is GetAllDeliveriesInUserByStatusLoadingState) {
              return const Center(
                child: GlobalLoadingIndicator(),
              );
            } else if (state is GetAllDeliveriesInUserByStatusErrorState) {
              return Center(
                child: Text(state.errorMsg),
              );
            } else if (state is GetAllDeliveriesInUserByStatusSuccessState) {
              if (cubit.deliveriesFilteredList.isEmpty) {
                return const GlobalNoDeliveriesWidget();
              }
              return ListView.builder(
                  itemCount: cubit.deliveriesFilteredList.length,
                  itemBuilder: (context, index) =>
                      GlobalDeliveryFilteredCardsWidget(
                        deliveryFilteredCardsModel: DeliveryFilteredCardsModel(
                            arrowOnTap: isSelected ? () {} : () {},
                            onTap: isSelected
                                ? () {
                                    Navigator.pushNamed(context,
                                        Routes.addOrderFromDeliveryRoute,
                                        arguments: DeliveryModel(
                                          deliveryName: cubit
                                              .deliveriesFilteredList[index]
                                              .deliveryName,
                                          deliveryPhone: cubit
                                              .deliveriesFilteredList[index]
                                              .deliveryPhone,
                                          deliveryLocation: cubit
                                              .deliveriesFilteredList[index]
                                              .deliveryLocation,
                                          deliveryStatus: deliveryStatus,
                                          deliveryRate: cubit
                                              .deliveriesFilteredList[index]
                                              .deliveryRate,
                                        ));
                                  }
                                : () {},
                            isSelected: isSelected,
                            deliveryModel: DeliveryModel(
                              deliveryName: cubit
                                  .deliveriesFilteredList[index].deliveryName,
                              deliveryPhone: cubit
                                  .deliveriesFilteredList[index].deliveryPhone,
                              deliveryLocation: cubit
                                  .deliveriesFilteredList[index]
                                  .deliveryLocation,
                              deliveryStatus: cubit
                                  .deliveriesFilteredList[index].deliveryStatus,
                              deliveryRate: cubit
                                  .deliveriesFilteredList[index].deliveryRate,
                            )),
                      ));
            } else {
              return const GlobalSomethingWrongWidget();
            }
          },
        ),
      ),
    );
  }
}
