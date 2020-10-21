// class LoginModel {
//   String username;
//   String password;
//   bool isLoading;
//   LoginErrorModel error;
//
//   LoginModel({this.username, this.password, this.isLoading, this.error});
// }

class LoginErrorModel {
  bool status;
  String value;

  LoginErrorModel({this.status, this.value});
}