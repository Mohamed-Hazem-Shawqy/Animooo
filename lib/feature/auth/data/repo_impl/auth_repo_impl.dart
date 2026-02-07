import 'dart:developer';
import 'dart:io';
import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/core/database/api/end_points.dart';
import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/feature/auth/data/model/user_model.dart';
import 'package:animooo/feature/auth/data/model/user_signin_model.dart';
import 'package:animooo/feature/auth/domain/entities/signup_entity.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepoImpl implements AuthRepoDecl {
  AuthRepoImpl(this.secureStorage);
  final FlutterSecureStorage secureStorage;
  @override
  Future<Either<Failure, UserEntity>> userSignUp(
    UserEntity signupEntity,
    String password,
  ) async {
    try {
      final UserRequestModel userModel = UserRequestModel(
        firstName: signupEntity.firstName??"",
        lastName: signupEntity.lastName??"",
        email: signupEntity.email??"",
        phone: signupEntity.phone??"",

        image: File(signupEntity.image??""),
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

  @override
  Future<Either<Failure, UserEntity>> userSignIn(
    UserEntity signinEntity,
    String password,
  ) async {
    try {
      final response = await getit.dioService.get(
        path: EndPoints.logIn,
        queryParameters: {"email": signinEntity.email, "password": password},
      );
      if (response.containsKey('error')) {
        return Left(ServerFailure(response['error'][0] ?? 'Unknown error'));
      }
      final result = UserSigninModel.fromJson(response);
      await secureStorage.write(
        key: AppStrings.kAccessToken,
        value: result.accessToken,
      );

      await secureStorage.write(
        key: AppStrings.kRefreshToken,
        value: result.refreshToken,
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      log(e.toString());
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure("Unexpected error occurred ${e.toString()}"));
    }
  }
}
