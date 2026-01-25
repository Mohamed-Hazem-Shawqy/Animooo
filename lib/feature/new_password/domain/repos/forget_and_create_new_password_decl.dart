import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/feature/new_password/domain/entity/create_new_password_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ForgetAndCreateNewPasswordDecl {
  Future<Either<Failure, String>> forgetPassword(String email);
  Future<Either<Failure, CreateNewPasswordEntity>> createNewPassword(
    String password,
    String confirmPassword,
    String email,
    
  );
}
