import 'package:animooo/core/database/api/dio_service.dart';
import 'package:animooo/feature/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:animooo/feature/new_password/data/repos/forget_and_create_new_password_impl.dart';
import 'package:animooo/feature/new_password/domain/repos/forget_and_create_new_password_decl.dart';
import 'package:animooo/feature/otp/data/repos/otp_repo_impl.dart';
import 'package:animooo/feature/otp/domain/repos/otp_repo_decl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

Future<void> setUpGetit() async{
  getit.registerLazySingleton<Dio>((() => Dio()));
  getit.registerLazySingleton<DioService>((() => DioService(getit<Dio>())));
  getit.registerLazySingleton<AuthRepoDecl>((() => AuthRepoImpl()));
  getit.registerLazySingleton<OtpRepoDecl>((() => OtpRepoImpl()));
  getit.registerLazySingleton<ForgetAndCreateNewPasswordDecl>((() => ForgetAndCreateNewPasswordImpl()));

  
  
 
}
