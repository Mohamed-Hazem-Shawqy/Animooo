part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;
  final String email;
  const ForgetPasswordSuccess({required this.message, required this.email});
  @override
  List<Object> get props => [message];
}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String message;
  const ForgetPasswordFailure({required this.message});
  @override
  List<Object> get props => [message];
}
