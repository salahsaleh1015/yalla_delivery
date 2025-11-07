import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/delivery_domain/delivery_entities/delivery_account_entity.dart';
import '../../../../domain/delivery_domain/delivery_usecases/delivery_account_usecases/delivery_edit_account_data_usecase.dart';

part 'delivery_edit_info_state.dart';

class DeliveryEditInfoCubit extends Cubit<DeliveryEditInfoStates> {
  DeliveryEditInfoCubit(this.editDeliveryAccountDataUseCase)
      : super(DeliveryEditInfoInitialState());

  final DeliveryEditAccountDataUseCase editDeliveryAccountDataUseCase;

 static DeliveryEditInfoCubit get(context) => BlocProvider.of(context);

  Future<void> editDeliveryInfoByEmail(
      {required String email,
      required String name,
      required String location,
      required String phoneNumber}) async {
    emit(DeliveryEditInfoLoadingState());

    var result = await editDeliveryAccountDataUseCase.call(
        param: DeliveryAccountEntity(
          deliveryMail: email,
          deliveryName: name,
          deliveryLocation: location,
          deliveryPhone: phoneNumber,
        ));
    result.fold((failure) {
      emit(DeliveryEditInfoErrorState(errorMessage: failure.message));
    }, (updatedDelivery) {
      emit(DeliveryEditInfoSavedState());
    });
  }
}
