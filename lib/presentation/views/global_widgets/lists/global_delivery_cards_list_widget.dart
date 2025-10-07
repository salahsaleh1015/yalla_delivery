import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/presentation/models/delivery_card_model.dart';
import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_delivery_cards_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_no_deliveries_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_something_wrong_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_models/user_view_models/delivery_in_user_cubit/delivery_in_user_cubit.dart';

class GlobalDeliveryCardsListWidget extends StatelessWidget {
  const GlobalDeliveryCardsListWidget({super.key, required this.height});

  final double height;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryInUserCubit>(
      create: (context) => DeliveryInUserCubit()..getAllDeliveries(),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: BlocBuilder<DeliveryInUserCubit, DeliveryInUserStates>(
          builder: (context, state) {
            var cubit = DeliveryInUserCubit.get(context);

            if (state is GetAllDeliveriesInUsersLoadingState) {
              return const Center(
                child: GlobalLoadingIndicator(),
              );
            } else if (state is GetAllDeliveriesInUserErrorState) {
              return Center(
                child: Text(state.errorMsg),
              );
            } else if (state is GetAllDeliveriesInUserSuccessState) {
              if (cubit.deliveriesList.isEmpty) {
                return const GlobalNoDeliveriesWidget();
              }
              return ListView.builder(
                  itemCount: cubit.deliveriesList.length,
                  itemBuilder: (context, index) {
                    var delivery = DeliveryModel(
                      deliveryMail: cubit.deliveriesList[index].deliveryMail,
                      deliveryPassword:
                          cubit.deliveriesList[index].deliveryPassword,
                      deliveryName: cubit.deliveriesList[index].deliveryName,
                      deliveryPhone: cubit.deliveriesList[index].deliveryPhone,
                      deliveryLocation:
                          cubit.deliveriesList[index].deliveryLocation,
                      deliveryStatus:
                          cubit.deliveriesList[index].deliveryStatus,
                      deliveryRate: cubit.deliveriesList[index].deliveryRate,
                    );
                    return GlobalDeliveryCardsWidget(
                      deliveryCardModel: DeliveryCardModel(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.addOrderFromDeliveryRoute,
                              arguments: delivery);
                        },
                        arrowOnTap: () {},
                        deliveryStatus:
                            cubit.deliveriesList[index].deliveryStatus,
                        deliveryModel: delivery,
                      ),
                    );
                  });
            } else {
              return const GlobalSomethingWrongWidget();
            }
          },
        ),
      ),
    );
  }
}
