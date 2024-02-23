// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

class AuthenticationState {
  final AuthStatus status;
  final AuthEntity user;

  AuthenticationState({required this.status, required this.user});

  AuthenticationState copyWith({
    AuthStatus? status,
    AuthEntity? user,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  String toString() => 'AuthenticationState(status: $status, user: $user)';

  @override
  bool operator ==(covariant AuthenticationState other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.user == user;
  }

  @override
  int get hashCode => status.hashCode ^ user.hashCode;
}
