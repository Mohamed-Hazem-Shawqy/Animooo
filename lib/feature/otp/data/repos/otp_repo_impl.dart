import 'dart:developer';
import 'package:animooo/core/database/api/end_points.dart';
import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/feature/otp/data/model/otp_model.dart';
import 'package:animooo/feature/otp/data/model/send_new_otp_code.dart';
import 'package:animooo/feature/otp/domain/entities/otp_entity.dart';
import 'package:animooo/feature/otp/domain/repos/otp_repo_decl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OtpRepoImpl implements OtpRepoDecl {
  @override
  Future<Either<Failure, OtpEntity>> verifyOtp(
    String verificationCode,
    OtpEntity otpEntity,
  ) async {
    try {
      final OtpRequestModel otpRequestModel = OtpRequestModel(
        email: otpEntity.email,
        code: verificationCode,
      );

      final response = await getit.dioService.post(
        path: EndPoints.verficationCode,
        data: otpRequestModel.toJson(),
      );

      final json = response;
      final otpfromJson = OtpModel.fromJson(json);
      return right(otpfromJson.toEntity());
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      log("ERROR TYPE: ${e.runtimeType}");
      log("ERROR DETAILS: $e");
      return left(ServerFailure("Unexpected error occurred ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, OtpEntity>> sendNewOtpCode(OtpEntity otpEntity) async {
    try {
      SendNewOtpCode sendNewOtpCode = SendNewOtpCode(email: otpEntity.email);
      final response = await getit.dioService.post(
        path: EndPoints.newVerficationCode,
        data: sendNewOtpCode.toJson(),
      );
      final json = response;
      final otpfromJson = SendNewOtpCode.fromJson(json);
      return right(otpfromJson.toEntity());
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure("Unexpected error occurred ${e.toString()}"));
    }
  }
}


