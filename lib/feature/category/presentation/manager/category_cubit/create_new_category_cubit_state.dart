part of 'create_new_category_cubit.dart';

sealed class CreateNewCategoryCubitState extends Equatable {
  const CreateNewCategoryCubitState();

  @override
  List<Object> get props => [];
}

final class CreateNewCategoryCubitStateInitial
    extends CreateNewCategoryCubitState {}

final class CreateNewCategoryCubitStateLoading
    extends CreateNewCategoryCubitState {}

final class CreateNewCategoryCubitStateSuccess
    extends CreateNewCategoryCubitState {
  final CreateNewCategoryEntity categoryEntity;
  const CreateNewCategoryCubitStateSuccess(this.categoryEntity);
  @override
  List<Object> get props => [categoryEntity];
}

final class CreateNewCategoryCubitStateFailure
    extends CreateNewCategoryCubitState {
  final String errMessage;
  const CreateNewCategoryCubitStateFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
