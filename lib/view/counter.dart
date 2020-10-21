import 'package:bbd_client/bloc/counter/counter_bloc.dart';
import 'package:bbd_client/bloc/counter/counter_event.dart';
import 'package:bbd_client/bloc/counter/counter_state.dart';
import 'package:bbd_client/login/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  int operationVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Copba'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if(state is CounterUninitialized) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    'Belum di set',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          } else {
            CounterLoaded counterLoad = state as CounterLoaded;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${counterLoad.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        this.operationVal = int.parse(value);
                      },
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.bloc<CounterBloc>().add(IncrementEvent(operationVal)),
            tooltip: 'Increment',
            child: Icon(Icons.add),
            heroTag: 'increment',
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => context.bloc<CounterBloc>().add(DecrementEvent(operationVal)),
            tooltip: 'Decrement',
            heroTag: 'decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (BuildContext context) => new LoginView())
            ),
            tooltip: 'Login',
            child: Icon(Icons.login),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}