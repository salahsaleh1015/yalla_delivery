


import 'package:delivery_app/domain/entities/home_entities/home_shop_entity.dart';

abstract class GetShopsStates {}

final class GetShopsInitialState extends GetShopsStates {}

final class GetShopsLoadingState extends GetShopsStates {}

final class GetShopsLoadedState extends GetShopsStates {
  final List<HomeShopEntity> shops;
  GetShopsLoadedState({required this.shops});
}

final class GetShopsErrorState extends GetShopsStates {
  final String errorMessage;
  GetShopsErrorState({required this.errorMessage});
}



// final class GetShopProductsLoadingState extends GetShopsStates {}
//
// final class GetShopProductsLoadedState extends GetShopsStates {}
//
// final class GetShopProductsErrorState extends GetShopsStates {
//   final String errorMessage;
//
//   GetShopProductsErrorState({required this.errorMessage});
// }