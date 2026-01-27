
import 'package:animooo/core/database/api/end_points.dart';
import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/feature/new_password/data/models/create_new_password_model.dart';
import 'package:animooo/feature/new_password/data/models/forget_password_model.dart';
import 'package:animooo/feature/new_password/domain/entity/create_new_password_entity.dart';
import 'package:animooo/feature/new_password/domain/repos/forget_and_create_new_password_decl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ForgetAndCreateNewPasswordImpl implements ForgetAndCreateNewPasswordDecl {
  @override
  Future<Either<Failure, String>> forgetPassword(String email) async {
    try {
      ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel(
        email: email,
      );

      final response = await getit.dioService.post(
        path: EndPoints.forgetPassword,
        data: forgetPasswordModel.toJson(),
      );

      return Right(response['message']);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure("Unexpected error occurred ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, CreateNewPasswordEntity>> createNewPassword(
    String password,
    String confirmPassword,
    String email,
  ) async {
    try {
      CreateNewPasswordRequestModel createNewPasswordResponseModel =
          CreateNewPasswordRequestModel(
            password: password,
            confirmPassword: confirmPassword,
            email: email,
          );
      final response = await getit.dioService.post(
        path: EndPoints.createNewPassword,
        data: createNewPasswordResponseModel.toJson(),
      );
      final model = CreateNewPasswordModel.fromJson(response);
      final entity = model.toEntity();
      return Right(entity);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure("Unexpected error occurred ${e.toString()}"));
    }
  }
}


