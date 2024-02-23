import 'package:fiveth_month_exam/core/either/either.dart';
import 'package:fiveth_month_exam/core/failure/failure.dart';
import 'package:fiveth_month_exam/core/useCase/usecase.dart';
import 'package:fiveth_month_exam/features/authentication/domain/entity/auth_entity.dart';
import 'package:fiveth_month_exam/features/authentication/domain/repository/auth_repository.dart';

class AuthUseCase extends UseCase<AuthEntity, NoParams> {
  final AuthRepository _repository;

  AuthUseCase({required AuthRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, AuthEntity>> call(NoParams params) async {
    if (params is GetUser) {
      return await _repository.getUser();
    } else if (params is SignIn) {
      return await _repository.signIn(params.email, params.password);
    } else {
      throw const ServerFailure(msg: "Xatolik tuzaga keldi");
    }
  }
}

class GetUser extends NoParams {}

class SignIn extends NoParams {
  final String email;
  final String password;

  SignIn({
    required this.email,
    required this.password,
  });
}
