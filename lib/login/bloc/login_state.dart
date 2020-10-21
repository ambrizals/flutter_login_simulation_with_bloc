part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String username;
  final String password;
  final bool loading;
  final bool isAuthenticated;
  final LoginErrorModel error;

  LoginState({this.username, this.password, this.loading, this.error, this.isAuthenticated});

  var loginErrorModel = new LoginErrorModel(
    status: false,
    value: null
  );


  LoginState copyWith({
    username,
    password,
    loading,
    error,
    isAuthenticated
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        loading: loading ?? this.loading ?? false,
        error : error ?? this.error ?? loginErrorModel,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated ?? false
    );
  }

  @override
  List<Object> get props => [username, password, loading, error, isAuthenticated];

}