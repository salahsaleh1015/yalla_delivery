import 'package:delivery_app/domain/delivery_domain/delivery_entities/delivery_account_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/delivery_domain/delivery_usecases/delivery_account_usecases/delivery_fetch_account_data_usecase.dart';

part 'delivery_info_state.dart';

class DeliveryGetInfoCubit extends Cubit<DeliveryGetInfoStates> {
  DeliveryGetInfoCubit(this.fetchDeliveryAccountDataUseCase)
      : super(DeliveryInfoInitialState());

  static DeliveryGetInfoCubit get(context) => BlocProvider.of(context);

  final DeliveryFetchAccountDataUseCase fetchDeliveryAccountDataUseCase;

  Future<void> getDeliveryInfo({required String deliveryMail}) async {
    emit(DeliveryGetInfoLoadingState());

    var result =
        await fetchDeliveryAccountDataUseCase.call(param: deliveryMail);
    result.fold((failure) {
      emit(DeliveryGetInfoErrorState(errorMessage: failure.message));
    }, (delivery) {
      emit(DeliveryGetInfoLoadedState(delivery: delivery));
    });
  }




  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}



