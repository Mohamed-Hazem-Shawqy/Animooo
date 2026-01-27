import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static void pushNamedAndRemoveUntil(
    BuildContext? context,
    RouteName routeName,
  ) {
    Navigator.of(
      context ?? getit.globalContext,
    ).pushNamedAndRemoveUntil(routeName.path, (route) => false);
  }

  static void pushNamed(
    BuildContext? context,
    RouteName routeName, {
    Object? arguments,
  }) {
    Navigator.of(
      context ?? getit.globalContext,
    ).pushNamed(routeName.path, arguments: arguments);
  }

  static void pushReplaceMentNamed(
    BuildContext? context,
    RouteName routeName, {
    Object? arguments,
  }) {
    Navigator.of(
      context ?? getit.globalContext,
    ).pushReplacementNamed(routeName.path, arguments: arguments);
  }

  static void pop(BuildContext? context) {
    Navigator.of(context ?? getit.globalContext).pop();
  }
}
