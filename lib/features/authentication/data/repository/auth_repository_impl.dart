import 'package:fiveth_month_exam/core/either/either.dart';
import 'package:fiveth_month_exam/core/failure/failure.dart';
import 'package:fiveth_month_exam/features/authentication/data/data_source/data_source.dart';
import 'package:fiveth_month_exam/features/authentication/data/model/auth_model.dart';
import 'package:fiveth_month_exam/features/authentication/domain/entity/auth_entity.dart';
import 'package:fiveth_month_exam/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl({required AuthDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, AuthEntity>> getUser() async {
    try {
      final user = await _dataSource.getUser();
      return Right(AuthModel.isFireBaseUser(user));
    } catch (e) {
      return Left(ServerFailure(msg: "Xatolik bor $e"));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signIn(
      String email, String password) async {
    try {
      final user = await _dataSource.signIn(email, password);
      return Right(AuthModel.isFireBaseUser(user));
    } catch (e) {
      return Left(ServerFailure(msg: "XAtolik bor $e"));
    }
  }
}
