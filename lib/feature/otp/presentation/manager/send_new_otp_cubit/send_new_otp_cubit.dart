import 'package:animooo/feature/otp/domain/entities/otp_entity.dart';
import 'package:animooo/feature/otp/domain/repos/otp_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_new_otp_state.dart';

class SendNewOtpCubit extends Cubit<SendNewOtpState> {
  SendNewOtpCubit(this.otpRepoDecl) : super(SendNewOtpInitial());

  final OtpRepoDecl otpRepoDecl ;

  Future sendNewOtpCode(OtpEntity otpEntity) async {
    emit(SendNewOtpLoading());
    final result = await otpRepoDecl.sendNewOtpCode(otpEntity);
    result.fold(
      (failure) => emit(SendNewOtpFailuer(errMessage: failure.errMessage)),
      (otp) => emit(SendNewOtpSuccess(otpEntity: otp)),
    );
  }
}
