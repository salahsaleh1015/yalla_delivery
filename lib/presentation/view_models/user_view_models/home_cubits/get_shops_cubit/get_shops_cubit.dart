import 'package:delivery_app/presentation/view_models/user_view_models/home_cubits/get_shops_cubit/get_shops_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/usecases/home_usecases/home_get_shops_usecase.dart';

class GetShopsCubit extends Cubit<GetShopsStates> {
  GetShopsCubit(this.homeGetShopsUseCase) : super(GetShopsInitialState());

  static GetShopsCubit get(context) => BlocProvider.of(context);

  HomeGetShopsUseCase homeGetShopsUseCase;

  Future<void> fetchShops() async {
    emit(GetShopsLoadingState());
    var result = await homeGetShopsUseCase.call();
    result.fold((failure) {
      emit(GetShopsErrorState(errorMessage: failure.message));
    }, (shops) {
      emit(GetShopsLoadedState(shops: shops));
    });
  }
}
