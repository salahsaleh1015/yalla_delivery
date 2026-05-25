import 'package:delivery_app/domain/usecases/cart_usecases/get_user_orders_by_phone_number_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/cart_get_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartGetOrdersCubit extends Cubit<CartGetOrdersStates> {
  CartGetOrdersCubit(this.getUserOrdersByPhoneNumberUseCase)
      : super(CartGetOrdersInitialState());

  GetUserOrdersByPhoneNumberUseCase getUserOrdersByPhoneNumberUseCase;

  static CartGetOrdersCubit get(context) => BlocProvider.of(context);

  Future<void> getOrders({required String userPhoneNumber}) async {
    emit(CartGetOrdersLoadingState());
    var result = await getUserOrdersByPhoneNumberUseCase.call(userPhoneNumber);
    result.fold((failure) {
      emit(CartGetOrdersErrorState(errorMsg: failure.message));
    }, (orders) {
      emit(CartGetOrderSuccessState(orders: orders));
    });
  }
}
