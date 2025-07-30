import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/firebase_services/delivery_firestore_services.dart';

part 'delivery_in_user_state.dart';

class DeliveryInUserCubit extends Cubit<DeliveryInUserStates> {
  DeliveryInUserCubit() : super(DeliveryInUserInitial());

  static DeliveryInUserCubit get(context) => BlocProvider.of(context);

  final DeliveryFirestoreServices _deliveryFirestoreServices =
      DeliveryFirestoreServices();

  List<DeliveryModel> get deliveriesFilteredList => _deliveriesFilteredList;
  final List<DeliveryModel> _deliveriesFilteredList = [];

  List<DeliveryModel> get deliveriesList => _deliveriesList;
  final List<DeliveryModel> _deliveriesList = [];

  getAllDeliveriesByStatus({required String deliveryStatus}) async {
    emit(GetAllDeliveriesInUserByStatusLoadingState());

    _deliveryFirestoreServices
        .getAllDeliveriesByStatus(deliveryStatus: deliveryStatus)
        .then((value) {
      for (int i = 0; i < value.length; i++) {
        _deliveriesFilteredList.add(
            DeliveryModel.fromJson(value[i].data() as Map<String, dynamic>));
      }
    }).then((val) {
      emit(GetAllDeliveriesInUserByStatusSuccessState());
    }).catchError((error) {
      emit(
          GetAllDeliveriesInUserByStatusErrorState(errorMsg: error.toString()));
    });
  }

  getAllDeliveries() async {
    emit(GetAllDeliveriesInUsersLoadingState());

  await  _deliveryFirestoreServices.getAllDeliveries().then((value) {
      for (int i = 0; i < value.length; i++) {
        _deliveriesList.add(
            DeliveryModel.fromJson(value[i].data() as Map<String, dynamic>));
      }
      print("sssssssssssssssssssssssssssssssssssss");
      print(_deliveriesList.length);

    }).then((val) {
      emit(GetAllDeliveriesInUserSuccessState());
    }).catchError((error) {
      emit(GetAllDeliveriesInUserErrorState(errorMsg: error.toString()));
    });
  }
}
