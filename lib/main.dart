import 'package:flutter/material.dart';
import 'package:travel_app/router/routegenerator.dart';
import 'package:travel_app/views/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
