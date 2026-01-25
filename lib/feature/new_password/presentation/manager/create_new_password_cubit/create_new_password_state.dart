part of 'create_new_password_cubit.dart';

sealed class CreateNewPasswordState extends Equatable {
  const CreateNewPasswordState();

  @override
  List<Object> get props => [];
}

final class CreateNewPasswordInitial extends CreateNewPasswordState {}

final class CreateNewPasswordLoading extends CreateNewPasswordState {}

final class CreateNewPasswordSuccess extends CreateNewPasswordState {
  final CreateNewPasswordEntity createNewPasswordEntity;

  const CreateNewPasswordSuccess({required this.createNewPasswordEntity});
  @override
  List<Object> get props => [createNewPasswordEntity];
}

final class CreateNewPasswordFailure extends CreateNewPasswordState {
  final String errMessage;
  const CreateNewPasswordFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
