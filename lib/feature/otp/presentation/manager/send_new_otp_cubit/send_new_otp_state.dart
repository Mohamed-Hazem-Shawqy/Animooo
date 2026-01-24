part of 'send_new_otp_cubit.dart';

sealed class SendNewOtpState extends Equatable {
  const SendNewOtpState();

  @override
  List<Object> get props => [];
}

final class SendNewOtpInitial extends SendNewOtpState {}
final class SendNewOtpLoading extends SendNewOtpState {}
final class SendNewOtpSuccess extends SendNewOtpState {
  final OtpEntity otpEntity;
  const SendNewOtpSuccess({required this.otpEntity});
  @override
  List<Object> get props => [otpEntity];
}
final class SendNewOtpFailuer extends SendNewOtpState {
  final String errMessage;
  const SendNewOtpFailuer({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
