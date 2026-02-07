part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class SignUpAuthLoading extends AuthState {}

final class SignUpAuthSuccess extends AuthState {
  final UserEntity signupEntity;
  const SignUpAuthSuccess(this.signupEntity);
  @override
  List<Object> get props => [signupEntity];
}

final class SignUpAuthFailure extends AuthState {
  final String errMessage;
  const SignUpAuthFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}

final class SignInAuthLoading extends AuthState {}

final class SignInAuthSuccess extends AuthState {
  final UserEntity signinEntity;
  const SignInAuthSuccess(this.signinEntity);
  @override
  List<Object> get props => [signinEntity];
}

final class SignInAuthFailure extends AuthState {
  final String errMessage;
  const SignInAuthFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
