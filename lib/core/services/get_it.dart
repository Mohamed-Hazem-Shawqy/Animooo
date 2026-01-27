import 'package:animooo/core/database/api/dio_service.dart';
import 'package:animooo/core/singletoon/shared_pref_singletoon.dart';
import 'package:animooo/feature/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:animooo/feature/new_password/data/repos/forget_and_create_new_password_impl.dart';
import 'package:animooo/feature/new_password/domain/repos/forget_and_create_new_password_decl.dart';
import 'package:animooo/feature/otp/data/repos/otp_repo_impl.dart';
import 'package:animooo/feature/otp/domain/repos/otp_repo_decl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getit = GetIt.instance;

Future<void> setUpGetit() async {
  getit.registerLazySingleton<Dio>((() => Dio()));
  getit.registerLazySingleton<FlutterSecureStorage>(
    (() => FlutterSecureStorage()),
  );
  getit.registerLazySingleton<DioService>(
    (() => DioService(getit<Dio>(), getit<FlutterSecureStorage>())),
  );
  getit.registerLazySingleton<AuthRepoDecl>(
    (() => AuthRepoImpl(getit<FlutterSecureStorage>())),
  );
  getit.registerLazySingleton<OtpRepoDecl>((() => OtpRepoImpl()));
  getit.registerLazySingleton<ForgetAndCreateNewPasswordDecl>(
    (() => ForgetAndCreateNewPasswordImpl()),
  );

  getit.registerLazySingleton<GlobalKey<NavigatorState>>(
    (() => GlobalKey<NavigatorState>()),
  );
  getit.registerLazySingleton<SharedPrefSingletoon>(
    () => SharedPrefSingletoon(getit<SharedPreferences>()),
  );

  final sharedPrefs = await SharedPreferences.getInstance();

  getit.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
}
