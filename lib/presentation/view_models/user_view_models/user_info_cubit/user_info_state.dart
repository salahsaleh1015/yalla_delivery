part of 'user_info_cubit.dart';


abstract class UserInfoStates {}

final class UserInfoInitialState extends UserInfoStates {}

final class UserInfoLoadingState extends UserInfoStates {}

final class UserInfoAddedSuccessFulState extends UserInfoStates {}

final class UserInfoUpdatedSuccessFulState extends UserInfoStates {}

final class UserInfoDeletedSuccessFulState extends UserInfoStates {}

final class UserInfoGetSuccessFulState extends UserInfoStates {}

final class UserInfoErrorState extends UserInfoStates {
  final String error;
  UserInfoErrorState({required this.error});
}

final class UserInfoNotFoundedState extends UserInfoStates {}

final class UserInfoFoundedState extends UserInfoStates {}


final class   UserInfoLoadedState extends UserInfoStates {
  final UserModel userModel;
  UserInfoLoadedState({required this.userModel});
}


 final class UserInfoUpdatedState extends UserInfoStates {
   final UserModel userModel;
   UserInfoUpdatedState({required this.userModel});
 }

 class UserLocationLoadedSuccessfullyState extends UserInfoStates {}
class UserLocationLoadingState extends UserInfoStates {}
class UserLocationErrorState extends UserInfoStates {
  final String error;
  UserLocationErrorState({required this.error});
}