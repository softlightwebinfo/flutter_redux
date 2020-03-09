import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/redux/app_actions.dart';
import 'package:flutter_redux_app/redux/app_state.dart';
import 'package:flutter_redux_app/redux/app_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          StoreConnector<AppState, int>(
            converter: (store) => store.state.counter,
            builder: (BuildContext context, counter) {
              return Text(
                counter.toString(),
                style: Theme.of(context).textTheme.display1,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<AppState, int>(
              converter: (store) => store.state.counter,
              builder: (BuildContext context, counter) {
                return Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(DecrementCounter());
            },
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 32),
          FloatingActionButton(
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(IncrementCounter());
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
