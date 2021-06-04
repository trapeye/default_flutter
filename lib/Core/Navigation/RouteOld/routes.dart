import 'package:flutter/material.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    final dynamic arguments = settings.arguments;
    switch (settings.name) {
      case '/':

      //if get no screen
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
