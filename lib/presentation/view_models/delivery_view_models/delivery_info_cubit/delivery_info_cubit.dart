import 'package:delivery_app/domain/delivery_domain/delivery_entities/delivery_account_entity.dart';
import 'package:delivery_app/domain/delivery_domain/delivery_usecases/delivery_edit_info_data_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/firebase_services/firestore_delivery_services.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/local_delivery_account_data_functions.dart';
import '../../../../domain/delivery_domain/delivery_repos/delivery_info_repo.dart';
import '../../../../domain/delivery_domain/delivery_usecases/delivery_fetch_account_data_usecase.dart';
import '../../../../domain/delivery_domain/delivery_usecases/delivery_fetch_status_usecase.dart';

part 'delivery_info_state.dart';

class DeliveryInfoCubit extends Cubit<DeliveryInfoStates> {
  DeliveryInfoCubit(
      this.fetchDeliveryAccountDataUseCase,
      this.editDeliveryAccountDataUseCase,
      this.fetchDeliveryStatusUseCase,
      this.deliveryInfoRepo)
      : super(DeliveryInfoInitialState());

  static DeliveryInfoCubit get(context) => BlocProvider.of(context);

  final DeliveryFetchInfoDataUseCase fetchDeliveryAccountDataUseCase;
  final DeliveryEditInfoDataUseCase editDeliveryAccountDataUseCase;
  final DeliveryFetchStatusUseCase fetchDeliveryStatusUseCase;
  final DeliveryInfoRepo deliveryInfoRepo;

  String? _cachedStatus; // ✅

  FirestoreDeliveryServices firestoreDeliveryServices =
      FirestoreDeliveryServices();

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

  Future<void> editDeliveryInfoByEmail(
      {required String email,
      required String name,
      required String location,
      required String phoneNumber,
      required String deliveryStatus}) async {
    emit(DeliveryEditInfoLoadingState());

    var result = await editDeliveryAccountDataUseCase.call(
        param: DeliveryInfoEntity(
      deliveryStatus: deliveryStatus,
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

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> getDeliveryStatus({required String email}) async {
    emit(DeliveryGetStatusLoadingState());

    var result = await fetchDeliveryStatusUseCase.call(param: email);
    result.fold((failure) {
      emit(DeliveryGetStatusErrorState(errorMessage: failure.message));
    }, (status) {
      emit(DeliveryGetStatusLoadedState(deliveryStatus: status));
    });
  }

  editDeliveryStatusByEmail(
      {required String email, required String deliveryStatus}) async {
    emit(DeliveryEditInfoLoadingState());

    await firestoreDeliveryServices
        .editDeliveryStatusByEmail(email: email, deliveryStatus: deliveryStatus)
        .then((value) => emit(DeliveryEditInfoSavedState()))
        .catchError((error) =>
            emit(DeliveryEditStatusErrorState(errorMessage: error.toString())));
  }
}
