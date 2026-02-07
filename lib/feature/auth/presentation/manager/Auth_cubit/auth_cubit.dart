
import 'dart:developer';

import 'package:animooo/core/singletoon/shared_pref_singletoon.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/feature/auth/domain/entities/signup_entity.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepoDecl, this.sharedPrefSingletoon)
    : super(AuthInitial());
  final AuthRepoDecl authRepoDecl;
  final SharedPrefSingletoon sharedPrefSingletoon;
   UserEntity? currenUser;
  Future userSignUp({
    required UserEntity userEntity,
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
    required UserEntity userEntity,
    required String password,
  }) async {
    emit(SignInAuthLoading());
    final response = await authRepoDecl.userSignIn(userEntity, password);

    response.fold((failure) => emit(SignInAuthFailure(failure.errMessage)), (
      user,
    ) async {
      currenUser=user;
      log("useer:${user.firstName.toString()}");
      await sharedPrefSingletoon.setBool(AppStrings.kisloggedin, true);
      await sharedPrefSingletoon.setString(
        AppStrings.kStoredUserFirstName,
        user.firstName??"name" ,
      );
      await sharedPrefSingletoon.setString(
        AppStrings.kStoredUserLastName,
        user.lastName??"name" ,
      );
      emit(SignInAuthSuccess(user));
    });
  }
  Future<void> loadUserFromCache() async {
  final isLoggedIn = sharedPrefSingletoon.getBool(AppStrings.kisloggedin) ?? false;
  log(isLoggedIn.toString());

  if (!isLoggedIn) return;

  final firstname = sharedPrefSingletoon.getString(AppStrings.kStoredUserFirstName);
  final lastname = sharedPrefSingletoon.getString(AppStrings.kStoredUserLastName);
  log(firstname.toString());

  if (firstname != null && lastname != null) {
    currenUser = UserEntity(
      firstName: firstname,
      lastName: lastname,
    );

    emit(SignInAuthSuccess(currenUser!));
  }
}
}