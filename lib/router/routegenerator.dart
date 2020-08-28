import 'package:flutter/material.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/views/PageDetail.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());
      case '/place_view':
        return MaterialPageRoute(builder: (_) => PageDetail(data: args));
    }
  }
}
