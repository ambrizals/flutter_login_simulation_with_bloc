import 'package:bbd_client/bloc/counter/counter_bloc.dart';
import 'package:bbd_client/login/bloc/login_bloc.dart';
import 'package:bbd_client/view/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (BuildContext context) => LoginBloc()),
        BlocProvider<CounterBloc>(create: (BuildContext context) => CounterBloc())
      ],
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: CounterView(),
        )
    );
  }
}
