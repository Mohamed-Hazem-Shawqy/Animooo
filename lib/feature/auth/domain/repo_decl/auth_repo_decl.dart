import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/feature/auth/domain/entities/signin_entity.dart';
import 'package:animooo/feature/auth/domain/entities/signup_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepoDecl {
  Future<Either<Failure,SignupEntity>> userSignUp(SignupEntity signupEntity, String password);
  Future<Either<Failure,SigninEntity>> userSignIn(SigninEntity signinEntity, String password);
}