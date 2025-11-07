import 'package:delivery_app/presentation/models/cached_user_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_caching_cubit/user_caching_cubit.dart';
import 'package:hive/hive.dart';
import 'package:get_it/get_it.dart';
import 'data/delivery_data/cached_user_repository.dart';
import 'domain/usecases/cache_user_usecase.dart';



final sl = GetIt.instance;

 // @InjectableInit()
 // void configureInjection(String env) => sl.init(environment: env);

Future<void> init(Box<CachedUserModel> cachedUserBox) async {
  // Repository
  sl.registerLazySingleton<ICachedUserRepository>(
        () => CachedUserRepository(cachedUserBox), // ✅ مرر الـ box
  );

  // UseCases
  sl.registerLazySingleton<CacheUserUseCase>(
        () => CacheUserUseCase(sl<ICachedUserRepository>()),
  );

  sl.registerLazySingleton<GetCachedUserUseCase>(
        () => GetCachedUserUseCase(sl<ICachedUserRepository>()),
  );

  sl.registerLazySingleton<UpdateCachedUserUseCase>(
        () => UpdateCachedUserUseCase(sl<ICachedUserRepository>()),
  );

  // Cubit
  sl.registerFactory<UserCachingCubit>(
        () => UserCachingCubit(sl<CacheUserUseCase>(), sl<GetCachedUserUseCase>(),sl<UpdateCachedUserUseCase>()),
  );
}
