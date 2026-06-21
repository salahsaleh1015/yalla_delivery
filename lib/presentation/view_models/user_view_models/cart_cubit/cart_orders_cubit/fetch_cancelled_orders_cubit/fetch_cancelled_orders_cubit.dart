import 'package:delivery_app/domain/usecases/cart_usecases/user_fetch_cancelled_orders_usecase.dart';
import 'package:delivery_app/domain/usecases/cart_usecases/user_fetch_pending_orders_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_cancelled_orders_cubit/fetch_cancelled_orders_state.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_pending_orders_cubit/fetch_pending_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FetchCancelledOrdersCubit extends Cubit<FetchCancelledOrdersStates> {
  FetchCancelledOrdersCubit(this.fetchCancelledOrdersUseCase)
      : super(FetchCancelledOrdersInitialState());

  UserFetchCancelledOrdersUseCase fetchCancelledOrdersUseCase;

  static FetchCancelledOrdersCubit get(context) => BlocProvider.of(context);

  Future<void> fetchCancelledOrders({required String phoneNumber}) async {
    emit(FetchCancelledOrdersLoadingState());
    var result = await fetchCancelledOrdersUseCase.call(phoneNumber);
    result.fold(
          (failure) {
        emit(FetchCancelledOrdersFailureState(errorMsg: failure.message));
      },
          (orders) {
        emit(FetchCancelledOrdersSuccessState( cancelledOrders: orders));
      },
    );
  }
}
