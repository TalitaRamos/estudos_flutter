import 'package:flutter/material.dart';
import 'package:widgets_estudos1/data/task_inherited.dart';
import 'package:widgets_estudos1/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
            color: Colors.blue,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        useMaterial3: false,
      ),
      home: const InitialScreen(),
    );
  }
}
