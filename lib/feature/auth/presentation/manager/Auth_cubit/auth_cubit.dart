import 'package:animooo/feature/auth/domain/entities/signin_entity.dart';
import 'package:animooo/feature/auth/domain/entities/signup_entity.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepoDecl) : super(SignUpAuthInitial());
  final AuthRepoDecl authRepoDecl;
  Future userSignUp({
    required SignupEntity userEntity,
    required String password,
  }) async {
    emit(SignUpAuthLoading());

    final response = await authRepoDecl.userSignUp(userEntity, password);

    response.fold(
      (failure) => emit(SignUpAuthFailure(failure.errMessage)),
      (user) => emit(SignUpAuthSuccess(user)),
    );
  }
  Future userSignIn({
    required SigninEntity userEntity,
    required String password,
  }) async {
    emit(SignInAuthLoading());
    final response = await authRepoDecl.userSignIn(userEntity, password);

    response.fold(
      (failure) => emit(SignInAuthFailure(failure.errMessage)),
      (user) => emit(SignInAuthSuccess(user)),
    );
  }
}
