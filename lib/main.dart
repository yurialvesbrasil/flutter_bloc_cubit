import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Bloc Cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Flutter Bloc Cubit'),
            ),
            body: const Center(
              child: Text('Home page'),
            )));
  }
}
