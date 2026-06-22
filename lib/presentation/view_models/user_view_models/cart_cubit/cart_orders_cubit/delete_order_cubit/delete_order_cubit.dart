import 'package:delivery_app/domain/usecases/cart_usecases/user_delete_order_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/delete_order_cubit/delete_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteOrderCubit extends Cubit<DeleteOrderStates> {
  DeleteOrderCubit(this.deleteOrderUseCase) : super(DeleteOrderInitialState());

  UserDeleteOrderUseCase deleteOrderUseCase;

  static DeleteOrderCubit get(context) => BlocProvider.of(context);

  void deleteOrder({required String orderId}) async {
    emit(DeleteOrderLoadingState());

    var result = await deleteOrderUseCase.call(orderId);

    result.fold(
      (failure) {
        emit(DeleteOrderErrorState(errorMessage: failure.message));
      },
      (orders) {
        emit(DeleteOrderSuccessState());
      },
    );
  }
}
