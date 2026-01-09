import 'package:delivery_app/domain/usecases/delivery_management_usecases/get_available_deliveries_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_available_delivery_cubit/get_available_delivery_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAvailableDeliveryCubit extends Cubit<GetAvailableDeliveryStates> {
  GetAvailableDeliveryCubit(this.getAvailableDeliveriesUseCase)
      : super(GetAvailableDeliveryInitialState());

 static GetAvailableDeliveryCubit  get(context) => BlocProvider.of(context);

  GetAvailableDeliveriesUseCase getAvailableDeliveriesUseCase;

  Future<void> getAvailableDeliveries() async {
    emit(GetAvailableDeliveryLoadingState());

    var result = await getAvailableDeliveriesUseCase.call('متاح');

    result.fold((failure) {
      emit(GetAvailableDeliveryErrorState(errorMessage: failure.message));
    }, (deliveries) {
      emit(GetAvailableDeliveryLoadedState(deliveries: deliveries));
    });
  }
}
