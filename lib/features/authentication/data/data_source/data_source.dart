import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiveth_month_exam/core/exception/exception.dart';
import 'package:fiveth_month_exam/core/failure/failure.dart';
import 'package:fiveth_month_exam/core/getIt/injector.dart';

abstract class AuthDataSource {
  Future<User> getUser();
  Future<User> signIn(String email, String password);

  factory AuthDataSource() => _AuthDataSourceImpl();
}

class _AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<User> getUser() async {
    try {
      final fb = injc<FirebaseAuth>();
      if (fb.currentUser == null) {
        throw ServerException(
          errorMassege: "Foydalanuvchi topilmadi",
          errorCode: "400",
        );
      }
      print("User is: ${FirebaseAuth.instance.currentUser!}");
      return fb.currentUser!;
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<User> signIn(String email, String password) async {
    try {
      final fb = injc<FirebaseAuth>();
      await fb
          .signInWithEmailAndPassword(email: email, password: password);
      return fb.currentUser!;
    } catch (e) {
      throw ServerFailure(msg: "${e}");
    }
  }
}
