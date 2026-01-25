import 'package:animooo/feature/new_password/domain/repos/forget_and_create_new_password_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetAndCreateNewPasswordDecl)
    : super(ForgetPasswordInitial());

  final ForgetAndCreateNewPasswordDecl forgetAndCreateNewPasswordDecl;

  Future forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    final response = await forgetAndCreateNewPasswordDecl.forgetPassword(email);
    response.fold(
      (l) => emit(ForgetPasswordFailure(message: l.errMessage)),
      (r) => emit(ForgetPasswordSuccess(message: r, email: email)),
    );
  }
}
