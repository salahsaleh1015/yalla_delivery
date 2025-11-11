part of 'shops_cubit.dart';


abstract class ShopsStates {}

final class ShopsInitialState extends ShopsStates {}

final class GetShopsLoadingState extends ShopsStates {}

final class GetShopsLoadedState extends ShopsStates {}

final class GetShopsErrorState extends ShopsStates {
  final String errorMessage;
  GetShopsErrorState({required this.errorMessage});
}



final class GetShopProductsLoadingState extends ShopsStates {}

final class GetShopProductsLoadedState extends ShopsStates {}

final class GetShopProductsErrorState extends ShopsStates {
  final String errorMessage;

  GetShopProductsErrorState({required this.errorMessage});
}