import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiveth_month_exam/features/authentication/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({required super.email,required super.avatarimg,required super.name});

  factory AuthModel.isFireBaseUser(User user) {
    return AuthModel(email: user.email ?? "NoName",avatarimg: user.photoURL ?? "",name: user.displayName ?? "");
  }
}
