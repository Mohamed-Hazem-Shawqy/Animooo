import 'package:animooo/feature/new_password/domain/entity/create_new_password_entity.dart';
import 'package:animooo/feature/new_password/domain/repos/forget_and_create_new_password_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  CreateNewPasswordCubit(this.forgetAndCreateNewPasswordDecl)
    : super(CreateNewPasswordInitial());

  final ForgetAndCreateNewPasswordDecl forgetAndCreateNewPasswordDecl;

  Future createNewPassword({
    required String password,
    required String confirmPassword,
    required String email,
  }) async {
    emit(CreateNewPasswordLoading());
    final response = await forgetAndCreateNewPasswordDecl.createNewPassword(
      password,
      confirmPassword,
      email,
    );
    response.fold(
      (failure) =>
          emit(CreateNewPasswordFailure(errMessage: failure.errMessage)),
      (user) => emit(CreateNewPasswordSuccess(createNewPasswordEntity: user)),
    );
  }
}
