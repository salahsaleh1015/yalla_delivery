import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/firebase_services/firestore_delivery_services.dart';

part 'delivery_edit_status_state.dart';

class DeliveryEditStatusCubit extends Cubit<DeliveryEditStatusStates> {
  DeliveryEditStatusCubit() : super(DeliveryEditStatusInitialState());


  final FirestoreDeliveryServices _firestoreDeliveryServices = FirestoreDeliveryServices();
  Future<void> editDeliveryStatusByEmail(
      {required String email, required String status}) async {
    emit(DeliveryEditStatusLoadingState());

    try {
      await _firestoreDeliveryServices.editDeliveryStatusByEmail(
          email: email, deliveryStatus: status);
      emit(DeliveryEditStatusSuccessState());
    } catch (e) {
      emit(DeliveryEditStatusErrorState(errorMessage: e.toString()));
    }
  }
}
