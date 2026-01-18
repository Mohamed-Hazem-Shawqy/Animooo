import 'dart:io';

import 'package:animooo/core/database/api/dio_service.dart';
import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/core/database/api/end_points.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/feature/auth/data/model/user_model.dart';
import 'package:animooo/feature/auth/domain/entities/signup_entity.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AuthRepoImpl implements AuthRepoDecl {
  AuthRepoImpl();

  @override
  Future<Either<Failure, SignupEntity>> userSignUp(
    SignupEntity signupEntity,
    String password,
  ) async {
    try {
      final userModel = UserModel(
        firstName: signupEntity.firstName,
        lastName: signupEntity.lastName,
        email: signupEntity.email,
        phone: signupEntity.phone,

        image: File(signupEntity.image),
        password: password,
      );

      final response = await getit.dioService.post(
        path: EndPoints.signUp,
        data: userModel.toMap(),
      );
      final userResult = UserResponseModel.fromJson(response['user']);
      return Right(userResult.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure("Unexpected error occurred ${e.toString()}"));
    }
  }
}

extension GetItExtension on GetIt {
  DioService get dioService => this<DioService>();
}
