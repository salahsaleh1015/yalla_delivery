import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/models/delivery_cards_filtered_model.dart';
import 'package:delivery_app/data/repos/delivery_management_repo/delivery_management_repo_impl.dart';
import 'package:delivery_app/domain/usecases/delivery_management_usecases/get_unavailable_deliveries_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_un_available_deliveries_cubit/get_un_available_deliveries_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_un_available_deliveries_cubit/get_un_available_deliveries_state.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_delivery_filtered_cards_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_no_deliveries_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_something_wrong_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalUnAvailableDeliveryCardsListWidget extends StatelessWidget {
  const GlobalUnAvailableDeliveryCardsListWidget({
    super.key,
    required this.height,
    required this.isSelected,
  });

  final double height;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetUnAvailableDeliveriesCubit>(
      create: (context) => GetUnAvailableDeliveriesCubit(
        GetUnAvailableDeliveriesUseCase(
          getIt.get<DeliveryManagementRepoImpl>(),
        ),
      )..getUnAvailableDeliveries(),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: BlocBuilder<GetUnAvailableDeliveriesCubit,
            GetUnAvailableDeliveriesStates>(
          builder: (context, state) {
            var cubit = GetUnAvailableDeliveriesCubit.get(context);
            if (state is GetUnAvailableDeliveriesLoadingState) {
              return const Center(
                child: GlobalLoadingIndicator(),
              );
            } else if (state is GetUnAvailableDeliveriesErrorState) {
              return Center(
                child: Text("حدث خطأ ما حاول مره اخرى"),
              );
            } else if (state is GetUnAvailableDeliveriesLoadedState) {
              if (state.deliveriesList.isEmpty) {
                return const GlobalNoDeliveriesWidget();
              }
              return RefreshIndicator(
                color: ColorManager.primary,
                onRefresh: () async {
                  cubit.getUnAvailableDeliveries();
                },
                child: ListView.builder(
                    itemCount: state.deliveriesList.length,
                    itemBuilder: (context, index) {
                      return GlobalDeliveryFilteredCardsWidget(
                        deliveryFilteredCardsModel: DeliveryFilteredCardsModel(
                            arrowOnTap: isSelected ? () {} : () {},
                            onTap: isSelected
                                ? () {
                                    Navigator.pushNamed(context,
                                        Routes.addOrderFromDeliveryRoute,
                                        arguments: state.deliveriesList[index]);
                                  }
                                : () {},
                            isSelected: isSelected,
                            deliveryModel: state.deliveriesList[index]),
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
