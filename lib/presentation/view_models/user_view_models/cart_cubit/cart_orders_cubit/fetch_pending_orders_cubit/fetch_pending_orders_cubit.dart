import 'package:delivery_app/domain/usecases/cart_usecases/user_fetch_pending_orders_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_pending_orders_cubit/fetch_pending_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FetchPendingOrdersCubit extends Cubit<FetchPendingOrdersStates> {
  FetchPendingOrdersCubit(this.fetchPendingOrdersUseCase)
      : super(FetchPendingOrdersInitialState());

  UserFetchPendingOrdersUseCase fetchPendingOrdersUseCase;

  static FetchPendingOrdersCubit get(context) => BlocProvider.of(context);

  Future<void> fetchPendingOrders({required String phoneNumber}) async {
    emit(FetchPendingOrdersLoadingState());
    var result = await fetchPendingOrdersUseCase.call(phoneNumber);
    result.fold(
          (failure) {
        emit(FetchPendingOrdersFailureState(errorMsg: failure.message));
      },
          (orders) {
        emit(FetchPendingOrdersSuccessState(pendingOrders: orders));
      },
    );
  }
}
