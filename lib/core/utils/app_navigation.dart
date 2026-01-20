import 'package:animooo/core/utils/route_manager.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static void pushNamedAndRemoveUntil(
    BuildContext context,
    RouteName routeName,
  ) {
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(routeName.path, (route) => false);
  }

  static void pushNamed(BuildContext context, RouteName routeName) {
    Navigator.of(context).pushNamed(routeName.path);
  }

  static void pushReplaceMentNamed(BuildContext context, RouteName routeName) {
    Navigator.of(context).pushReplacementNamed(routeName.path);
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
