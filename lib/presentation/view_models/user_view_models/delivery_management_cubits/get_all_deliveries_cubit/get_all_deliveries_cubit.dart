

import 'package:delivery_app/domain/usecases/delivery_management_usecases/get_all_deliveries_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/delivery_management_cubits/get_all_deliveries_cubit/get_all_deliveries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllDeliveriesCubit extends Cubit<GetAllDeliveriesStates> {
  GetAllDeliveriesCubit(this.getAllDeliveriesUseCase) : super(GetAllDeliveriesInitialState());



 static GetAllDeliveriesCubit  get(context) => BlocProvider.of(context);
  GetAllDeliveriesUseCase getAllDeliveriesUseCase;

  Future<void> getAllDeliveries()async{
    emit(GetAllDeliveriesLoadingState());
    var result =  await getAllDeliveriesUseCase.call();
    result.fold((failure) {
      emit(GetAllDeliveriesErrorState(errorMessage:  failure.message));
    }, (deliveries) {
      emit(GetAllDeliveriesLoadedState(deliveries: deliveries));
    });

  }
}
