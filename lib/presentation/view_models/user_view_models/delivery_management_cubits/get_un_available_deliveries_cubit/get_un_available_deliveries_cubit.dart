import 'package:delivery_app/domain/usecases/delivery_management_usecases/get_unavailable_deliveries_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_un_available_deliveries_cubit/get_un_available_deliveries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUnAvailableDeliveriesCubit
    extends Cubit<GetUnAvailableDeliveriesStates> {
  GetUnAvailableDeliveriesCubit(this.getUnAvailableDeliveriesUseCase)
      : super(GetUnAvailableDeliveriesInitialState());

  static GetUnAvailableDeliveriesCubit  get(context) => BlocProvider.of(context);

  GetUnAvailableDeliveriesUseCase getUnAvailableDeliveriesUseCase;

  Future<void> getUnAvailableDeliveries() async {
    emit(GetUnAvailableDeliveriesLoadingState());

    var result = await getUnAvailableDeliveriesUseCase.call('غير متاح');

    result.fold((failure) {
      emit(GetUnAvailableDeliveriesErrorState(errorMessage: failure.message));
    }, (deliveries) {
      emit(GetUnAvailableDeliveriesLoadedState(deliveriesList: deliveries));
    });
  }
}
