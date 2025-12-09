import 'package:delivery_app/data/cached_user_repository.dart';
import 'package:injectable/injectable.dart';


import '../../presentation/models/cached_user_model.dart';

@lazySingleton
class CacheUserUseCase {
  final ICachedUserRepository _cachedUserRepository;

  CacheUserUseCase(this._cachedUserRepository);

  Future<void> call(CachedUserModel userModel) async {
    await _cachedUserRepository.cacheUser(userModel);
  }
}

@lazySingleton
class GetCachedUserUseCase {
  final ICachedUserRepository _cachedUserRepository;

  GetCachedUserUseCase(this._cachedUserRepository);

  CachedUserModel? call() {
    return _cachedUserRepository.getCachedUser();
  }
}

@lazySingleton
class UpdateCachedUserUseCase {
  final ICachedUserRepository _cachedUserRepository;

  UpdateCachedUserUseCase(this._cachedUserRepository);

  Future<void> call(CachedUserModel userModel) {
    return _cachedUserRepository.updateCachedUser(userModel);
  }
}
