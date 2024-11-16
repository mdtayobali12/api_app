import 'package:api_app/screen/example_for.dart';
import 'package:api_app/screen/example_three.dart';
import 'package:api_app/screen/example_two.dart';
import 'package:api_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home:ExampleFor(),
    );
  }
}
