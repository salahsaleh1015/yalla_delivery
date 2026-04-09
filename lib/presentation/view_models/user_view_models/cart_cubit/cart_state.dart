


import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartUpdatedState extends CartStates {
  final Map<HomeShopProductEntity, int> selectedProducts;
  CartUpdatedState(this.selectedProducts);
}