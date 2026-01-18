import 'package:animooo/core/database/api/dio_service.dart';
import 'package:animooo/feature/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setUpGetit() {
  getit.registerLazySingleton<Dio>((() => Dio()));
  getit.registerLazySingleton<DioService>((() => DioService(getit<Dio>())));
  getit.registerLazySingleton<AuthRepoDecl>((() => AuthRepoImpl()));

  
  
 
}
