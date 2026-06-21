import 'package:delivery_app/domain/usecases/cart_usecases/user_fetch_completed_orders_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_completed_orders_cubit/fetch_completed_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchCompletedOrdersCubit extends Cubit<FetchCompletedOrdersStates> {
  FetchCompletedOrdersCubit(this.fetchCompletedOrdersUseCase)
      : super(FetchCompletedOrdersInitialState());

  UserFetchCompletedOrdersUseCase fetchCompletedOrdersUseCase;

  static FetchCompletedOrdersCubit get(context) => BlocProvider.of(context);

  Future<void> fetchCompletedOrders({required String phoneNumber}) async {
    emit(FetchCompleteOrdersLoadingState());
    var result = await fetchCompletedOrdersUseCase.call(phoneNumber);
    result.fold(
      (failure) {
        emit(FetchCompleteOrdersFailureState(errorMsg: failure.message));
      },
      (orders) {
        emit(FetchCompleteOrdersSuccessState(completedOrders: orders));
      },
    );
  }
}
