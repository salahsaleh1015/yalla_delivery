import 'package:delivery_app/domain/usecases/home_usecases/home_get_shop_products_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/home_cubits/get_shop_products_cubit/get_shop_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetShopProductsCubit extends Cubit<GetShopProductsStates> {
  GetShopProductsCubit(this.homeGetShopProductsUseCase)
      : super(GetShopProductsInitialState());
  static GetShopProductsCubit get(context) => BlocProvider.of(context);

  HomeGetShopProductsUseCase homeGetShopProductsUseCase;

  Future<void> fetchShopProducts({required String shopId}) async {
    emit(GetShopProductsLoadingState());
    var result = await homeGetShopProductsUseCase.call(shopId);
    result.fold((failure) {
      emit(GetShopProductsErrorState(errorMessage: failure.message));
    }, (products) {
      emit(GetShopProductsLoadedState(shopProductsList: products));
    });
  }
}
