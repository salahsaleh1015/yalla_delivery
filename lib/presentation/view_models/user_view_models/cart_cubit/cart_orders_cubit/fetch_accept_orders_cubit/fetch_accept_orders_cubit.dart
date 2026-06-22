import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/fetch_accept_orders_cubit/fetch_accept_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/usecases/cart_usecases/user_fetch_accepted_orders_usecase.dart';

class FetchAcceptOrdersCubit extends Cubit<FetchAcceptOrdersStates> {
  FetchAcceptOrdersCubit(this.fetchAcceptedOrdersUseCase)
      : super(FetchAcceptOrdersInitialState());

  UserFetchAcceptedOrdersUseCase fetchAcceptedOrdersUseCase;


  static FetchAcceptOrdersCubit get(context) => BlocProvider.of(context);

  Future<void> fetchAcceptedOrders({required String phoneNumber}) async {
    emit(FetchAcceptOrdersLoadingState());
    var result = await fetchAcceptedOrdersUseCase.call(phoneNumber);
    result.fold(
      (failure) {
        emit(FetchAcceptedOrdersFailureState(errorMsg: failure.message));
      },
      (orders) {
        emit(FetchAcceptedOrdersSuccessState(acceptedOrders: orders));
      },
    );
  }
}
