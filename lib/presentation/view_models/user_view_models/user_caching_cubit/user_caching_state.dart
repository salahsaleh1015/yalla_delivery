part of 'user_caching_cubit.dart';

@immutable
abstract class UserCachingStates {}

final class UserCachingInitial extends UserCachingStates {}

final class UserCachingLoadingState extends UserCachingStates {}

final class UserCachingLoadedState extends UserCachingStates {
  final CachedUserModel cachedUserModel;

  UserCachingLoadedState({required this.cachedUserModel});
}

final class UserCachingErrorState extends UserCachingStates {
  final String errorMessage;

  UserCachingErrorState({required this.errorMessage});
}

final class UserCachingSavedState extends UserCachingStates {}

final class UserCachingUpdateInCloudLoadingState extends UserCachingStates{}

final class UserCachingUpdateInCloudErrorState extends UserCachingStates{

  final String errorMessage;

  UserCachingUpdateInCloudErrorState({required this.errorMessage});
}


final class UserCachingUpdateInCloudSuccessState extends UserCachingStates{
  final CachedUserModel cachedUserModel;

  UserCachingUpdateInCloudSuccessState({required this.cachedUserModel});
}
