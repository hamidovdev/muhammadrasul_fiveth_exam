abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  final String msg;
  final int code;
  const ServerFailure({
    this.msg = "",
    this.code = 0,
  });
}
