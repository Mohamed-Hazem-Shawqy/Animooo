import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/singletoon/shared_pref_singletoon.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:animooo/feature/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return BlocProvider(
          create: (context) =>
              AuthCubit(getit<AuthRepoDecl>(), getit<SharedPrefSingletoon>()),
          child: MaterialApp(
            navigatorKey: getit.navigationState,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteManager.onGenerateRoute,
          ),
        );
      },
    );
  }
}
