import 'package:animooo/feature/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

abstract class RouteManager {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${setting.name}')),
          ),
        );
    }
  }
}

abstract class RouteName {
  static const String loginRoute = '/';
}
