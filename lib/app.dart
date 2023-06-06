import "package:flutter/material.dart";
import 'package:hooks_example/pages/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Demo'),
          ),
          body: const Home(),
        ));
  }
}
