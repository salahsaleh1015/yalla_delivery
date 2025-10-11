import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/firebase_services/firestore_delivery_services.dart';

part 'delivery_info_state.dart';

class DeliveryInfoCubit extends Cubit<DeliveryInfoStates> {
  DeliveryInfoCubit() : super(DeliveryInfoInitialState());

  static DeliveryInfoCubit get(context) => BlocProvider.of(context);

  final FirestoreDeliveryServices _firestoreDeliveryServices =
      FirestoreDeliveryServices();

  Future<void> getDeliveryInfo({required String deliveryMail}) async {
    emit(DeliveryGetInfoLoadingState());

    try {
      final doc = await _firestoreDeliveryServices.getDeliveryByMail(
          mail: deliveryMail);

      if (doc == null) {
        emit(DeliveryGetInfoErrorState(
            errorMessage: "No delivery found with this email."));
        return;
      }

      final delivery = DeliveryModel.fromJson(doc);
      emit(DeliveryGetInfoLoadedState(delivery: delivery));
    } catch (e) {
      emit(DeliveryGetInfoErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> editDeliveryInfoByEmail(
      {required String email,
      required String name,
      required String location,
      required String phoneNumber}) async {
    emit(DeliveryUpdateInfoLoadingState());

    try {
      await _firestoreDeliveryServices.editDeliveryInfoByEmail(
          email: email,
          name: name,
          location: location,
          phoneNumber: phoneNumber);
      emit(DeliveryUpdateInfoSavedState());
    } catch (e) {
      emit(DeliveryUpdateInfoErrorState(errorMessage: e.toString()));

      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> editDeliveryStatusByEmail(
      {required String email, required String status}) async {
    emit(DeliveryUpdateStatusLoadingState());

    try {
      await _firestoreDeliveryServices.editDeliveryStatusByEmail(
          email: email, deliveryStatus: status);
      emit(DeliveryUpdateStatusSuccessState());
    } catch (e) {
      emit(DeliveryUpdateStatusErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
