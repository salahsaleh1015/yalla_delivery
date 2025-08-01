import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/firebase_services/firestore_orders_services.dart';
import '../../../models/order_model.dart';

part 'user_orders_state.dart';

class UserOrdersCubit extends Cubit<UserOrdersStates> {
  UserOrdersCubit() : super(UserOrdersInitial());

  static UserOrdersCubit get(context) => BlocProvider.of(context);

  FirestoreOrdersServices firestoreOrdersServices = FirestoreOrdersServices();

  Future<void> addOrder({required OrderModel order}) async {
    emit(UserOrdersAddOrderLoadingState());

    await firestoreOrdersServices.addOrderToFireStore(order).then((value) {
      emit(UserOrdersAddOrderSuccessState());
    }).catchError((error) {
      emit(UserOrdersAddOrderErrorState(error: error.toString()));
    });
  }
}
