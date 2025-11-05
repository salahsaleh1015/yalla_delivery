import 'package:delivery_app/presentation/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/firebase_services/firestore_orders_services.dart';

part 'delivery_orders_state.dart';

class DeliveryOrdersCubit extends Cubit<DeliveryOrdersStates> {
  DeliveryOrdersCubit() : super(DeliveryOrdersInitialState());

  static DeliveryOrdersCubit get(context) => BlocProvider.of(context);

  FirestoreOrdersServices firestoreOrdersServices = FirestoreOrdersServices();

  List<OrderModel> get ordersList => _ordersList;
  final List<OrderModel> _ordersList = [];

  void getDeliveryPendingOrdersByGmail({required String gMail}) {
    emit(DeliveryGetPendingOrdersLoadingState());

    firestoreOrdersServices
        .getDeliveryPendingOrdersByGmail(deliveryMail: gMail)
        .then((value) {
      _ordersList.clear();
      for (var order in value) {
        _ordersList
            .add(OrderModel.fromJson(order.data() as Map<String, dynamic>));
      }
      emit(DeliveryGetPendingOrdersSuccessState());
    }).catchError((error) {
      emit(DeliveryGetPendingOrdersErrorState(error: error.toString()));
    });
  }

  void editDeliveryOrderStatus({
    required String orderId,
    required String newStatus,
    required String deliveryMail,
  }) async {
    emit(DeliveryEditOrderStatusLoadingState());
    try {
      await firestoreOrdersServices.editDeliveryOrderStatus(
        orderId: orderId,
        newStatus: newStatus,
      );

      getDeliveryPendingOrdersByGmail(gMail: deliveryMail);

      emit(DeliveryEditOrderStatusSuccessState());
    } catch (error) {
      emit(DeliveryEditOrderStatusErrorState(error: error.toString()));
    }
  }
}
