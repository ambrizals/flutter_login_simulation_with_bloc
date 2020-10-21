import 'package:bbd_client/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  FocusNode passwordNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordNode = new FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if(state.error.status == true) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.error.value)));
            context.bloc<LoginBloc>().add(LoginErrorHasRetrive());
          } else if (state.isAuthenticated == true) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Login Berhasil")));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text("Silahkan Masukkan Username dan Password untuk mengakses aplikasi ini."),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Masukkan Username',
                                labelText: 'Username',
                              ),
                              autocorrect: false,
                              enableSuggestions: false,
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(passwordNode);
                              },
                              onChanged: (value) {
                                context.bloc<LoginBloc>().add(LoginUsernameChanged(value));
                              },
                              validator: (value) {
                                if(value.isEmpty) {
                                  return 'Bagian ini wajib di isi !';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              focusNode: passwordNode,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Masukkan Password',
                                labelText: 'Password',
                              ),
                              obscureText: true,
                              autocorrect: false,
                              enableSuggestions: false,
                              onChanged: (value) {
                                context.bloc<LoginBloc>().add(LoginPasswordChanged(value));
                              },
                              validator: (value) {
                                if(value.isEmpty) {
                                  return 'Bagian ini wajib di isi !';
                                }
                                return null;
                              },
                            )
                          ],
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RaisedButton.icon(
                              icon: Icon(Icons.login),
                              elevation: 0,
                              label: Text('Login'),
                              onPressed: () {
                                if(_formKey.currentState.validate()) {
                                  context.bloc<LoginBloc>().add(LoginSubmitted());
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: RaisedButton.icon(
                              icon: Icon(Icons.history),
                              elevation: 0,
                              label: Text('Reset'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton.icon(
                        icon: Icon(Icons.vpn_key),
                        label: Text("Lupa Password"),
                      ),
                    )
                  ],
                ),
              );
            }
        ),
      )
    );
  }
}
