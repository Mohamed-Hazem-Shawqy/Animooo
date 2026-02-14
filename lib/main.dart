import 'package:animooo/app/my_app.dart';
import 'package:animooo/core/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/singletoon/shared_pref_singletoon.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:animooo/feature/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthCubit(getit<AuthRepoDecl>(), getit<SharedPrefSingletoon>())
                  ..loadUserFromCache(),
          ),
          BlocProvider(
            create: (context) => InternetConnectionCubit(),
            lazy: false,
          ),
         
        ],
        child: MyApp(),
      ),
    ),
  );
}
