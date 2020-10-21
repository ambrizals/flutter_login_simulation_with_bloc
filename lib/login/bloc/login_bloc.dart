import 'dart:async';

import 'package:bbd_client/login/bloc/login_model.dart';
import 'package:bbd_client/login/bloc/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if(event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    } else if (event is LoginErrorHasRetrive) {
      yield* _mapLoginErrorHasRetrieveToState(event, state);
    }
  }

  LoginState _mapUsernameChangedToState(LoginUsernameChanged event, LoginState state) {
    final String username = event.username;
    return state.copyWith(
      username: username
    );
  }

  LoginState _mapPasswordChangedToState(LoginPasswordChanged event, LoginState state) {
    final String password = event.password;
    return state.copyWith(
      password: password
    );
  }

  Stream<LoginState> _mapLoginSubmittedToState(LoginSubmitted event, LoginState state) async* {
    yield state.copyWith(
        loading: true
    );
    final bool = await LoginRepository().submitLogin(state);

    if(bool == true) {
      yield state.copyWith(
        loading: false,
        isAuthenticated: true
      );
    } else {
      try {
        var error = new LoginErrorModel();
        error.status = true;
        error.value = 'Username atau password yang anda masukkan salah';

        yield state.copyWith(
            loading: false,
            error: error
        );
      } catch(err) {
        print(err);
      }
    }
  }

  Stream<LoginState> _mapLoginErrorHasRetrieveToState(LoginErrorHasRetrive event, LoginState state) async* {
    var error = new LoginErrorModel();
    error.status = false;
    error.value = null;

    yield state.copyWith(
      error: error
    );
  }
}
