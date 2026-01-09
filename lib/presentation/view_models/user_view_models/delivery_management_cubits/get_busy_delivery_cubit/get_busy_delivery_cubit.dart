

import 'package:delivery_app/domain/usecases/delivery_management_usecases/get_busy_deliveries_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_busy_delivery_cubit/get_busy_delivery_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetBusyDeliveryCubit extends Cubit<GetBusyDeliveryStates> {
  GetBusyDeliveryCubit(this.getBusyDeliveriesUseCase) : super(GetBusyDeliveryInitialState());


  static GetBusyDeliveryCubit  get(context) => BlocProvider.of(context);
  GetBusyDeliveriesUseCase getBusyDeliveriesUseCase;

  Future<void> getBusyDeliveries() async {
    emit(GetBusyDeliveryLoadingState());
    var result = await getBusyDeliveriesUseCase.call('مشغول');
    result.fold((failure) {
      emit(GetBusyDeliveryErrorState(errorMessage: failure.message));
    }, (deliveries) {
      emit(GetBusyDeliveryLoadedState(busyDeliveries: deliveries));
    });
  }

}
