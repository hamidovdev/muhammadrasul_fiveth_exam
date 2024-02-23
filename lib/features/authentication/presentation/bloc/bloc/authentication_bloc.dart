import 'package:bloc/bloc.dart';
import 'package:fiveth_month_exam/core/getIt/injector.dart';
import 'package:fiveth_month_exam/core/status/auth_status.dart';
import 'package:fiveth_month_exam/features/authentication/domain/entity/auth_entity.dart';
import 'package:fiveth_month_exam/features/authentication/domain/usecase/usecase.dart';
import 'package:flutter/foundation.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(AuthenticationState(
          status: AuthStatus.pure,
          user: AuthEntity(email: "", avatarimg: "", name: ""),
        )) {
    on<GetFireBaseUser>((event, emit) async {
      final usecase = injc<AuthUseCase>();
      final either = await usecase.call(GetUser());
      either.either((failure) {
        emit(state.copyWith(status: AuthStatus.unAuthenticated));
      }, (value) {
        // print("Useerget => $value");
        emit(state.copyWith(status: AuthStatus.authenticated, user: value));
      });
    });
    on<SignInEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      final usecase = injc<AuthUseCase>();
      final either = await usecase
          .call(SignIn(email: event.email, password: event.password));
      either.either((failure) {
        emit(state.copyWith(
          status: AuthStatus.unAuthenticated,
        ));
        event.failure();
      }, (value) {
        // print("Userlogin $value");
        emit(state.copyWith(status: AuthStatus.authenticated, user: value));
        event.success();
      });
    });
  }
}
