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

  static void pushNamed(BuildContext context, RouteName routeName,{Object? arguments}) {
    Navigator.of(context).pushNamed(routeName.path,arguments:arguments );

  }

  static void pushReplaceMentNamed(BuildContext context, RouteName routeName,{Object? arguments}) {
    Navigator.of(context).pushReplacementNamed(routeName.path,arguments: arguments);
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class ArgumentsModel
{
  final String comeFromScreen;
  final Object data;
  final String orders;
  ArgumentsModel({ required this.comeFromScreen, required this.data, required this.orders});
}