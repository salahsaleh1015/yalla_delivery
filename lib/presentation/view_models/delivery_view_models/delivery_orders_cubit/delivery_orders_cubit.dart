import 'package:delivery_app/presentation/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/firebase_services/firestore_orders_services.dart';

part 'delivery_orders_state.dart';

class DeliveryOrdersCubit extends Cubit<DeliveryOrdersStates> {
  DeliveryOrdersCubit() : super(DeliveryOrdersInitialState());

  static DeliveryOrdersCubit get(context) => BlocProvider.of(context);

  FirestoreOrdersServices firestoreOrdersServices = FirestoreOrdersServices();

  ///todo: add cubit for each list in future
  ///

  List<OrderModel> get pendingOrdersList => _pendingOrdersList;
  final List<OrderModel> _pendingOrdersList = [];

  List<OrderModel> get acceptedOrdersList => _acceptedOrdersList;
  final List<OrderModel> _acceptedOrdersList = [];

  List<OrderModel> get canceledOrdersList => _canceledOrdersList;
  final List<OrderModel> _canceledOrdersList = [];

  List<OrderModel> get completedOrdersList => _completedOrdersList;
  final List<OrderModel> _completedOrdersList = [];

  void getDeliveryPendingOrdersByGmail({
    required String gMail,
  }) {
    emit(DeliveryGetPendingOrdersLoadingState());

    firestoreOrdersServices
        .getDeliveryPendingOrdersByGmail(
      deliveryMail: gMail,
    )
        .then((value) {
      _pendingOrdersList.clear();
      for (var order in value) {
        _pendingOrdersList
            .add(OrderModel.fromJson(order.data() as Map<String, dynamic>));
      }
      emit(DeliveryGetPendingOrdersSuccessState());
    }).catchError((error) {
      emit(DeliveryGetPendingOrdersErrorState(error: error.toString()));
    });
  }

  void getDeliveryAcceptedOrdersByGmail({
    required String gMail,
  }) {
    emit(DeliveryGetAcceptedOrdersLoadingState());

    firestoreOrdersServices
        .getDeliveryAcceptedOrdersByGmail(
      deliveryMail: gMail,
    )
        .then((value) {
      _acceptedOrdersList.clear();
      for (var order in value) {
        _acceptedOrdersList
            .add(OrderModel.fromJson(order.data() as Map<String, dynamic>));
      }
      emit(DeliveryGetAcceptedOrdersSuccessState());
    }).catchError((error) {
      emit(DeliveryGetAcceptedOrdersErrorState(error: error.toString()));
    });
  }

  void getDeliveryCanceledOrdersByGmail({
    required String gMail,
  }) {
    emit(DeliveryGetCanceledOrdersLoadingState());

    firestoreOrdersServices
        .getDeliveryCanceledOrdersByGmail(
      deliveryMail: gMail,
    )
        .then((value) {
      _canceledOrdersList.clear();
      for (var order in value) {
        _canceledOrdersList
            .add(OrderModel.fromJson(order.data() as Map<String, dynamic>));
      }
      emit(DeliveryGetCanceledOrdersSuccessState());
    }).catchError((error) {
      emit(DeliveryGetCanceledOrdersErrorState(error: error.toString()));
    });
  }

  void getDeliveryCompletedOrdersByGmail({
    required String gMail,
  }) {
    emit(DeliveryGetCompletedOrdersLoadingState());

    firestoreOrdersServices
        .getDeliveryCompletedOrdersByGmail(
      deliveryMail: gMail,
    )
        .then((value) {
      _completedOrdersList.clear();
      for (var order in value) {
        _completedOrdersList
            .add(OrderModel.fromJson(order.data() as Map<String, dynamic>));
      }
      emit(DeliveryGetCompletedOrdersSuccessState());
    }).catchError((error) {
      emit(DeliveryGetCompletedOrdersErrorState(error: error.toString()));
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

      getDeliveryPendingOrdersByGmail(
        gMail: deliveryMail,
      );

      getDeliveryAcceptedOrdersByGmail(
        gMail: deliveryMail,
      );

      emit(DeliveryEditOrderStatusSuccessState());
    } catch (error) {
      emit(DeliveryEditOrderStatusErrorState(error: error.toString()));
    }
  }

  void deleteOrder({required String orderId}) async {
    emit(DeliveryDeleteOrderLoadingState());
    await firestoreOrdersServices.deleteOrder(orderId: orderId).then((value) {
      emit(DeliveryDeleteOrderSuccessState());
    }).catchError((error) {
      emit(DeliveryDeleteOrderErrorState(error: error.toString()));
    });
  }
}
