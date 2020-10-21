import 'login_bloc.dart';

class LoginRepository {
  Future<bool> submitLogin(LoginState value) async {
    if (value.username == 'admin' && value.password == 'admin') {
      return true;
    } else {
      return false;
    }
  }
}