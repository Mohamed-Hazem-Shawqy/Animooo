import 'package:animooo/app/my_app.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setUpGetit();
  //10.0.2.2 - Android Emulator localhost
  runApp(MyApp());
}

