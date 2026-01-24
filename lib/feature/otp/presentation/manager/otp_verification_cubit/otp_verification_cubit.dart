import 'package:animooo/feature/otp/domain/entities/otp_entity.dart';
import 'package:animooo/feature/otp/domain/repos/otp_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit(this.otpRepoDecl) : super(OtpVerificationInitial());
  final OtpRepoDecl otpRepoDecl;

  Future<void> verifyOtp(String verificationCode, OtpEntity otpEntity) async {
    emit(OtpVerificationLoading());
    final result = await otpRepoDecl.verifyOtp(verificationCode, otpEntity);
    result.fold(
      (failure) => emit(OtpVerificationFailure(errMessage: failure.errMessage)),
      (otp) => emit(OtpVerificationSuccess(otpEntity: otp)),
    );
  }
}
