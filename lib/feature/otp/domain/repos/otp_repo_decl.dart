import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/feature/otp/domain/entities/otp_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OtpRepoDecl {
  Future<Either<Failure, OtpEntity>> verifyOtp(
    String verificationCode,
    OtpEntity otpEntity,
  );
  Future<Either<Failure, OtpEntity>> sendNewOtpCode(
    
    OtpEntity otpEntity,
  );
}
