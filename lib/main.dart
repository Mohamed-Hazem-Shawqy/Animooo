import 'package:animooo/app/my_app.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setUpGetit();
  //10.0.2.2 - Android Emulator localhost
  runApp(
    EasyLocalization(
      supportedLocales: [Locale(AppStrings.kEn), Locale(AppStrings.kAr)],
      path: 'assets/translations',
      fallbackLocale: Locale(AppStrings.kEn),
      saveLocale: true,
      child: MyApp(),
    ),
  );
}
