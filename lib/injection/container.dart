import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network_dio.dart';
import '../data/data_source/user_remote_data_source.dart';
import '../data/repository_impl/user_repo_impl.dart';
import '../domain/repository/user_repostiory.dart';
import '../domain/user_cases/add_user_usecase.dart';
import '../domain/user_cases/update_user_usecase.dart';
import '../domain/user_cases/user_usecases.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<Dio>(() => DioClient.dio);

  getIt.registerLazySingleton<UserRemoteDatasource>(
    () => UserRemoteDatasource(dio: getIt<Dio>()),
  );

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDatasource: getIt<UserRemoteDatasource>()),
  );

  getIt.registerLazySingleton<GetUsersUseCase>(
    () => GetUsersUseCase(repository: getIt<UserRepository>()),
  );

  getIt.registerLazySingleton<AddUserUseCase>(
    () => AddUserUseCase(repository: getIt()),
  );

  getIt.registerLazySingleton<UpdateUserUseCase>(
    () => UpdateUserUseCase(repository: getIt()),
  );
}
