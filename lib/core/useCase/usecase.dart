
import 'package:fiveth_month_exam/core/either/either.dart';
import 'package:fiveth_month_exam/core/failure/failure.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
