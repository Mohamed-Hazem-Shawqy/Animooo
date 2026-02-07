import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/feature/auth/domain/entities/signup_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepoDecl {
  Future<Either<Failure, UserEntity>> userSignUp(
    UserEntity signupEntity,
    String password,
  );
  Future<Either<Failure, UserEntity>> userSignIn(
    UserEntity signinEntity,
    String password,
  );
}
