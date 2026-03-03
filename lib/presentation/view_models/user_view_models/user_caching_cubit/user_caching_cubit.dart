import 'package:delivery_app/core/services/firebase_services/firestore_user_info_services.dart';
import 'package:delivery_app/data/models/cached_user_model.dart';
import 'package:delivery_app/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/usecases/cache_user_usecase.dart';


part 'user_caching_state.dart';

class UserCachingCubit extends Cubit<UserCachingStates> {
  final CacheUserUseCase _cacheUserUseCase;
  final GetCachedUserUseCase _getCachedUserUseCase;
  final UpdateCachedUserUseCase _updateCachedUserUseCase;
  final FirebaseUserServices _firebaseUserServices;

  UserCachingCubit(this._cacheUserUseCase, this._getCachedUserUseCase,
      this._updateCachedUserUseCase,this._firebaseUserServices)
      : super(UserCachingInitial());

  late CachedUserModel cachedUserModel;

  static UserCachingCubit get(context) => BlocProvider.of(context);

  Future<void> cacheUser(CachedUserModel userModel) async {
    emit(UserCachingLoadingState());
    await _cacheUserUseCase(userModel);
    cachedUserModel = userModel;

    emit(UserCachingSavedState());
  }

  Future<void> loadCachedUser() async {
    emit(UserCachingLoadingState());

    final cachedUser = _getCachedUserUseCase(); // من غير باراميتر
    if (cachedUser != null) {
      cachedUserModel = cachedUser; // خزّنه في المتغير الداخلي
      emit(UserCachingLoadedState(
        cachedUserModel: cachedUser,
      ));
    } else {
      emit(UserCachingErrorState(errorMessage: 'User not found'));
    }
  }

  Future<void> updateUser({required CachedUserModel cachedUserModel}) async {
    emit(UserCachingLoadingState());

    await _updateCachedUserUseCase(cachedUserModel);
    this.cachedUserModel = cachedUserModel;
    updateUserInCloud(
      updatedUser: cachedUserModel
    );
    emit(UserCachingLoadedState(cachedUserModel: cachedUserModel));
  }


  Future<void> updateUserInCloud({required CachedUserModel updatedUser}) async {
    emit(UserCachingUpdateInCloudLoadingState());
    try {
      await _firebaseUserServices.updateUserInfo(updatedUser);

      cachedUserModel = updatedUser; // Update local user state
      emit(UserCachingUpdateInCloudSuccessState(
        cachedUserModel: cachedUserModel,
      ));
    } catch (e) {
      emit(UserCachingUpdateInCloudErrorState(errorMessage: e.toString()));
    }
  }
}
