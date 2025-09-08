import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/usecases/cache_user_usecase.dart';
import '../../../models/cached_user_model.dart';

part 'user_caching_state.dart';

class UserCachingCubit extends Cubit<UserCachingStates> {
  final CacheUserUseCase _cacheUserUseCase;
  final GetCachedUserUseCase _getCachedUserUseCase;

  UserCachingCubit(this._cacheUserUseCase, this._getCachedUserUseCase)
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
      emit(UserCachingLoadedState(cachedUserModel: cachedUser));
    } else {
      emit(UserCachingErrorState(errorMessage: 'User not found'));
    }
  }
}
