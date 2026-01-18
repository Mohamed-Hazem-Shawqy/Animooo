part of 'auth_cubit.dart';

sealed class SignUpAuthState extends Equatable {
  const SignUpAuthState();
  @override
  List<Object> get props => [];
}

final class SignUpAuthInitial extends SignUpAuthState {}

final class SignUpAuthLoading extends SignUpAuthState {}

final class SignUpAuthSuccess extends SignUpAuthState {
  final SignupEntity signupEntity;
  const SignUpAuthSuccess(this.signupEntity);
  @override
  List<Object> get props => [signupEntity];
}
final class SignUpAuthFailure extends SignUpAuthState {
  final String errMessage;
  const SignUpAuthFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
