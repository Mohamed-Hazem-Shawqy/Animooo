import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  EasyLocalization(
      supportedLocales: [Locale(AppStrings.kEn), Locale(AppStrings.kAr)],
      path: 'assets/translations',
      fallbackLocale: Locale(AppStrings.kEn),
      saveLocale: true,
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
          
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteManager.onGenerateRoute, 
          );
        },
      ),
    );
  }
}
