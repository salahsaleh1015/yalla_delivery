import 'package:delivery_app/core/utils/constants.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/models/delivery_cards_filtered_model.dart';
import 'package:delivery_app/data/models/delivery_model.dart';
import 'package:delivery_app/data/repos/delivery_management_repo/delivery_management_repo_impl.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:delivery_app/domain/usecases/delivery_management_usecases/get_available_deliveries_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_in_user_cubit/delivery_in_user_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_available_delivery_cubit/get_available_delivery_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_available_delivery_cubit/get_available_delivery_state.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_delivery_filtered_cards_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_no_deliveries_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/hive_functions.dart';

class GlobalAvailableDeliveryCardsListWidget extends StatefulWidget {
  const GlobalAvailableDeliveryCardsListWidget({
    super.key,
    required this.height,
    this.onSelectedDelivery,
  });
  final double height;
  final ValueChanged<DeliveryEntity>? onSelectedDelivery;
  @override
  State<GlobalAvailableDeliveryCardsListWidget> createState() =>
      _GlobalAvailableDeliveryCardsListWidgetState();
}

class _GlobalAvailableDeliveryCardsListWidgetState
    extends State<GlobalAvailableDeliveryCardsListWidget> {
  int _selectedIndex = 0;
  // Track the selected index
  void _onCardTap(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Call your function with the clicked item's ID
    _handleItemClick("item_$index");
  }

  void _handleItemClick(String id) {
    print("Item clicked: $id");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAvailableDeliveryCubit>(
      create: (context) => GetAvailableDeliveryCubit(
          GetAvailableDeliveriesUseCase(
              getIt.get<DeliveryManagementRepoImpl>()))
        ..getAvailableDeliveries(),
      child: BlocBuilder<GetAvailableDeliveryCubit, GetAvailableDeliveryStates>(
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
            if (state.deliveries.isNotEmpty) {
              return SizedBox(
                width: double.infinity,
                height: widget.height,
                child: RefreshIndicator(
                  onRefresh: ()async{
                    await clearHiveBox(boxName: kAvailableDeliveryBox);
                    cubit.getAvailableDeliveries();
                  },
                  child: ListView.builder(
                      itemCount: state.deliveries.length,
                      itemBuilder: (context, index) {
                        return GlobalDeliveryFilteredCardsWidget(
                          index: index,
                          deliveryFilteredCardsModel: DeliveryFilteredCardsModel(
                              arrowOnTap: () {
                                ///todo index == _selectedIndex navigate to chat details view
                              },
                              onTap: () {
                                _onCardTap(index);
                                widget.onSelectedDelivery
                                    ?.call(state.deliveries[index]);
                              },
                              isSelected: index == _selectedIndex,
                              deliveryModel: state.deliveries[index]),
                        );
                      }),
                ),
              );
            } else {
              return const GlobalNoDeliveriesWidget();
            }
          } else {
            return const GlobalNoDeliveriesWidget();
          }
        },
      ),
    );
  }
}
