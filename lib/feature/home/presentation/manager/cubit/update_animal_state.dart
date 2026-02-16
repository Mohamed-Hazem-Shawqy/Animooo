part of 'update_animal_cubit.dart';

sealed class UpdateAnimalState extends Equatable {
  const UpdateAnimalState();

  @override
  List<Object> get props => [];
}

final class UpdateAnimalInitial extends UpdateAnimalState {}
final class UpdateAnimalLoading extends UpdateAnimalState {}
final class UpdateAnimalSuccess extends UpdateAnimalState {
  final GetAllAnimalEntity animal;
  const UpdateAnimalSuccess(this.animal);
  @override
  List<Object> get props => [animal];
}
final class UpdateAnimalFailure extends UpdateAnimalState {
  final String errorMessage;
  const UpdateAnimalFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
