part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class GetFireBaseUser extends AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final VoidCallback failure;
  final VoidCallback success;

  SignInEvent({
    required this.email,
    required this.password,
    required this.failure,
    required this.success,
  });
}
