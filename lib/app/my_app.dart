import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
         
      return MaterialApp(
        navigatorKey: getit.navigationState,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteManager.onGenerateRoute,
      );
    },
  );

    
  }
}