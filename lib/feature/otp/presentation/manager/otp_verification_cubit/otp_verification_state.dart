part of 'otp_verification_cubit.dart';

sealed class OtpVerificationState extends Equatable {
  const OtpVerificationState();

  @override
  List<Object> get props => [];
}

final class OtpVerificationInitial extends OtpVerificationState {}

final class OtpVerificationLoading extends OtpVerificationState {}

final class OtpVerificationSuccess extends OtpVerificationState {
  final OtpEntity otpEntity;

  const OtpVerificationSuccess({required this.otpEntity});
  @override
  List<Object> get props => [otpEntity];
}

final class OtpVerificationFailure extends OtpVerificationState {
  final String errMessage;

  const OtpVerificationFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
