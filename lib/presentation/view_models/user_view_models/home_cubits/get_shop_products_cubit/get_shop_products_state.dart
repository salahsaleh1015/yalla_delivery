




import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';

abstract class GetShopProductsStates {}

final class GetShopProductsInitialState extends GetShopProductsStates {}

final class GetShopProductsLoadingState extends GetShopProductsStates {}

 final class GetShopProductsLoadedState extends GetShopProductsStates {

   final List<HomeShopProductEntity> shopProductsList;

   GetShopProductsLoadedState({required this.shopProductsList});
 }

final class GetShopProductsErrorState extends GetShopProductsStates {
  final String errorMessage;

  GetShopProductsErrorState({required this.errorMessage});
}