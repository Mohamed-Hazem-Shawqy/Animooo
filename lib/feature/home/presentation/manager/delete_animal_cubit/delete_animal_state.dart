part of 'delete_animal_cubit.dart';

sealed class DeleteAnimalState extends Equatable {
  const DeleteAnimalState();

  @override
  List<Object> get props => [];
}

final class DeleteAnimalInitial extends DeleteAnimalState {}
final class DeleteAnimalLoading extends DeleteAnimalState {}
final class DeleteAnimalSuccess extends DeleteAnimalState {
  final int animalId;

  const DeleteAnimalSuccess(this.animalId);
  @override
  List<Object> get props => [animalId];
}
final class DeleteAnimalFailure extends DeleteAnimalState {
  final String errorMessage;

  const DeleteAnimalFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}