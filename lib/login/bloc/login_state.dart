part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String username;
  final String password;
  final bool loading;
  final LoginErrorModel error;

  LoginState({this.username, this.password, this.loading, this.error});


  LoginState copyWith({
    username,
    password,
    loading,
    error
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        loading: loading ?? this.loading ?? false,
        error : error ?? this.error
    );
  }

  @override
  List<Object> get props => [username, password, loading, error];

}