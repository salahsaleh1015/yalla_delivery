import 'package:injectable/injectable.dart';

import '../../data/repository/cached_user_repository.dart';
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
