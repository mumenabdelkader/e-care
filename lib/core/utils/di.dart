import 'package:clinic/core/networking/dio_factory.dart';
import 'package:clinic/features/authentication/data/repos/auth_repo.dart';
import 'package:clinic/features/authentication/data/services/auth_service.dart';
import 'package:clinic/features/authentication/presentation/controller/register/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  _setupAuth();
}

void _setupAuth() {
  getIt.registerLazySingleton<Dio>(() => DioFactory().dio);
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt()));
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authService: getIt()),
  );
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));
}
