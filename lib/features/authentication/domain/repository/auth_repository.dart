import 'package:fiveth_month_exam/core/either/either.dart';
import 'package:fiveth_month_exam/core/failure/failure.dart';
import 'package:fiveth_month_exam/features/authentication/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> getUser();
  Future<Either<Failure, AuthEntity>> signIn(String email,String password);
}
