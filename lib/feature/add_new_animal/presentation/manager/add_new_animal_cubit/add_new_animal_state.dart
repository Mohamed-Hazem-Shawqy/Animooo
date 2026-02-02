part of 'add_new_animal_cubit.dart';

sealed class AddNewAnimalState extends Equatable {
  const AddNewAnimalState();

  @override
  List<Object> get props => [];
}

final class AddNewAnimalInitial extends AddNewAnimalState {}

final class AddNewAnimalLoading extends AddNewAnimalState {}

final class AddNewAnimalSuccess extends AddNewAnimalState {
  final AddNewAnimalEntity addNewAnimalEntity;

  const AddNewAnimalSuccess({required this.addNewAnimalEntity});
  @override
  List<Object> get props => [addNewAnimalEntity];
}

final class AddNewAnimalFailure extends AddNewAnimalState {
  final String errMessage;

  const AddNewAnimalFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
