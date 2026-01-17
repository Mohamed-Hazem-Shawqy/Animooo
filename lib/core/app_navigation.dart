import 'package:animooo/core/utils/route_manager.dart';
import 'package:flutter/material.dart';

class AppNavigation {

 static  void pushNamedAndRemoveUntil(BuildContext context,RouteName routeName){
    Navigator.of(context).pushNamedAndRemoveUntil(
      routeName.path, (route) => false,);
  }
}
 