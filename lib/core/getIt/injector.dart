import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiveth_month_exam/features/authentication/data/data_source/data_source.dart';
import 'package:fiveth_month_exam/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:fiveth_month_exam/features/authentication/domain/repository/auth_repository.dart';
import 'package:fiveth_month_exam/features/authentication/domain/usecase/usecase.dart';
import 'package:get_it/get_it.dart';

final injc = GetIt.instance;

Future<void> getItInjector() async {
  injc.registerSingletonAsync(() async => FirebaseAuth.instance);
  getAuthUseCase();
}

getAuthUseCase() {
  injc
    ..registerFactory(() => AuthUseCase(repository: injc()))
    ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(dataSource: injc()))
    ..registerLazySingleton(() => AuthDataSource());
}
