import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/models/cached_user_model.dart';

abstract class ICachedUserRepository {
  Future<void> cacheUser(CachedUserModel userModel);
  CachedUserModel? getCachedUser();
 Future<void> updateCachedUser(CachedUserModel userModel);
}

@LazySingleton(as: ICachedUserRepository)
class CachedUserRepository implements ICachedUserRepository {
  final Box<CachedUserModel> _cachedUserBox;

  CachedUserRepository(this._cachedUserBox);

  @override
  Future<void> cacheUser(CachedUserModel userModel) async {
    await _cachedUserBox.put('cached_user', userModel);
  }

  @override
  CachedUserModel? getCachedUser() {
    return _cachedUserBox.get('cached_user');
  }

  @override
  Future<void> updateCachedUser(CachedUserModel userModel) {
    return _cachedUserBox.put('cached_user', userModel);
  }
}
