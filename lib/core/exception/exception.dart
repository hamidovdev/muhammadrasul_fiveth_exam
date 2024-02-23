class ServerException implements Exception {
  final String errorMassege;
  final String errorCode;
  ServerException({
    required this.errorMassege,
    required this.errorCode,
  });

  get message => null;

  get code => null;

  @override
  String toString() =>
      'ServerExseption(errorMassege: $errorMassege, errorCode: $errorCode)';
}
