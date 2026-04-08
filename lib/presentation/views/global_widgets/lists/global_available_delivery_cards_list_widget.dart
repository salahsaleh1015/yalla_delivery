import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/utils/constants.dart';
import 'package:delivery_app/core/utils/functions/hive_functions.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/models/delivery_cards_filtered_model.dart';
import 'package:delivery_app/data/repos/delivery_management_repo/delivery_management_repo_impl.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_available_delivery_cubit/get_available_delivery_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_available_delivery_cubit/get_available_delivery_state.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_no_deliveries_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_something_wrong_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/delivery_management_usecases/get_available_deliveries_usecase.dart';
import '../global_delivery_filtered_cards_widget.dart';

class GlobalAvailableDeliveryCardsListWidget extends StatelessWidget {
  const GlobalAvailableDeliveryCardsListWidget({
    super.key,
    required this.height,
    required this.isSelected,
  });

  final double height;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAvailableDeliveryCubit>(
      create: (context) => GetAvailableDeliveryCubit(
        GetAvailableDeliveriesUseCase(
          getIt.get<DeliveryManagementRepoImpl>(),
        ),
      )..getAvailableDeliveries(),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child:
            BlocBuilder<GetAvailableDeliveryCubit, GetAvailableDeliveryStates>(
          builder: (context, state) {
            var cubit = GetAvailableDeliveryCubit.get(context);
            if (state is GetAvailableDeliveryLoadingState) {
              return const Center(
                child: GlobalLoadingIndicator(),
              );
            } else if (state is GetAvailableDeliveryErrorState) {
              return Center(
                child: Text("حدث خطأ ما حاول مره اخرى"),
              );
            } else if (state is GetAvailableDeliveryLoadedState) {
              if (state.deliveries.isEmpty) {
                return const GlobalNoDeliveriesWidget();
              }
              return RefreshIndicator(
                color: ColorManager.primary,
                onRefresh: () async {
                  await clearHiveBox(boxName: kAvailableDeliveryBox);
                  cubit.getAvailableDeliveries();
                },
                child: ListView.builder(
                    itemCount: state.deliveries.length,
                    itemBuilder: (context, index) {
                      return GlobalDeliveryFilteredCardsWidget(
                        index: index,
                        deliveryFilteredCardsModel: DeliveryFilteredCardsModel(
                            arrowOnTap: isSelected ? () {} : () {},
                            onTap: isSelected
                                ? () {
                                    Navigator.pushNamed(context,
                                        Routes.addOrderFromDeliveryRoute,
                                        arguments: state.deliveries[index]);
                                  }
                                : () {},
                            isSelected: isSelected,
                            deliveryModel: state.deliveries[index]),
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
