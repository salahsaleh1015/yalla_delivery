import 'package:delivery_app/presentation/models/shop_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/firebase_services/firestore_home_services.dart';
import '../../../../models/product_model.dart';

part 'shops_state.dart';

class ShopsCubit extends Cubit<ShopsStates> {
  ShopsCubit() : super(ShopsInitialState());

  static ShopsCubit get(context) => BlocProvider.of(context);

  final FirestoreHomeServices _firestoreHomeServices = FirestoreHomeServices();

  List<ShopModel> get shopsList => _shopsList;
  final List<ShopModel> _shopsList = [];

  List<ProductModel> get shopProductsList => _shopProductsList;
  final List<ProductModel> _shopProductsList = [];

  getAllShops() {
    emit(GetShopsLoadingState());
    _firestoreHomeServices
        .getAllShops()
        .then((value) {
          for (var element in value) {
            _shopsList.add(
                ShopModel.fromJson(element.data() as Map<String, dynamic>));
          }
        })
        .then((value) => emit(GetShopsLoadedState()))
        .catchError((error) {
          emit(GetShopsErrorState(errorMessage: error.toString()));
        });
  }

  getShopsProductsByShopId({required String shopId}) {
    emit(GetShopProductsLoadingState());
    _firestoreHomeServices
        .getProductsByShopId(shopId: shopId)
        .then((value) {
          for (var element in value) {
            _shopProductsList.add(
                ProductModel.fromJson(element.data() as Map<String, dynamic>));
          }
        })
        .then((value) => emit(GetShopProductsLoadedState()))
        .catchError((error) {
          emit(GetShopProductsErrorState(errorMessage: error.toString()));
        });
  }
}
