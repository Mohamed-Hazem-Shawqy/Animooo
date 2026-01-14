import 'package:animooo/feature/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => const SplashView());
     default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${setting.name}'),
            ),
          ),
        );
  }
}