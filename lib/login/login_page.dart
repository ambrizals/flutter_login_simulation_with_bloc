import 'package:bbd_client/login/bloc/login_bloc.dart';
import 'package:bbd_client/login/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(),
      child: LoginView(),
    );
  }
}
