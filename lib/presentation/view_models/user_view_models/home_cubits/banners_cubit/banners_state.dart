part of 'banners_cubit.dart';


abstract class BannersStates {}

final class BannersInitialState extends BannersStates {}

final class BannersLoadedState extends BannersStates {}

final class BannersErrorState extends BannersStates {
  final String errorMessage;
  BannersErrorState({required this.errorMessage});
}

final class BannersLoadingState extends BannersStates {}
