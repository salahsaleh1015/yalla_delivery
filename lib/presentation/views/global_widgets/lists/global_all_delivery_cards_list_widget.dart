import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/utils/constants.dart';
import 'package:delivery_app/core/utils/functions/hive_functions.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/models/delivery_card_model.dart';
import 'package:delivery_app/data/repos/delivery_management_repo/delivery_management_repo_impl.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_all_deliveries_cubit/get_all_deliveries_cubit.dart';

import 'package:delivery_app/presentation/views/global_widgets/global_delivery_cards_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_no_deliveries_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_something_wrong_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/delivery_management_usecases/get_all_deliveries_usecase.dart';
import '../../../view_models/user_view_models/delivery_management_cubits/get_all_deliveries_cubit/get_all_deliveries_state.dart';

class GlobalAllDeliveryCardsListWidget extends StatelessWidget {
  const GlobalAllDeliveryCardsListWidget({super.key, required this.height});

  final double height;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllDeliveriesCubit>(
      create: (context) => GetAllDeliveriesCubit(
        GetAllDeliveriesUseCase(
          getIt.get<DeliveryManagementRepoImpl>()
        ),
      )..getAllDeliveries(),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: BlocBuilder<GetAllDeliveriesCubit, GetAllDeliveriesStates>(
          builder: (context, state) {
            var cubit = GetAllDeliveriesCubit.get(context);
            if (state is GetAllDeliveriesLoadingState) {
              return const Center(
                child: GlobalLoadingIndicator(),
              );
            } else if (state is GetAllDeliveriesErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is GetAllDeliveriesLoadedState) {
              if (state.deliveries.isEmpty) {
                return const GlobalNoDeliveriesWidget();
              }
              return RefreshIndicator(
                color: ColorManager.primary,
                onRefresh: () async {
                  await clearHiveBox(boxName: kAllDeliveriesBox);
                  cubit.getAllDeliveries();
                },
                child: ListView.builder(
                    itemCount: state.deliveries.length,
                    itemBuilder: (context, index) {

                      return GlobalDeliveryCardsWidget(
                        deliveryCardModel: DeliveryCardModel(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.addOrderFromDeliveryRoute,
                                arguments: state.deliveries[index]);
                          },
                          arrowOnTap: () {},
                          deliveryStatus:
                              state.deliveries[index].deliveryStatus,
                          deliveryModel: state.deliveries[index],
                        ),
                      );
                    }),
              );
            } else {
              return const GlobalSomethingWrongWidget();
            }
          },
        ),
      ),
    );
  }
}
