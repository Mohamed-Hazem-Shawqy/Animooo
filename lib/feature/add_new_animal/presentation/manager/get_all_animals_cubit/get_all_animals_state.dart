part of 'get_all_animals_cubit.dart';

sealed class GetAllAnimalsState extends Equatable {
  const GetAllAnimalsState();

  @override
  List<Object> get props => [];
}

final class GetAllAnimalsInitial extends GetAllAnimalsState {}

final class GetAllAnimalsLoading extends GetAllAnimalsState {}

final class GetAllAnimalsSuccess extends GetAllAnimalsState {
  final List<GetAllAnimalEntity> animals;
  const GetAllAnimalsSuccess({required this.animals});
  @override
  List<Object> get props => [animals];
}

final class GetAllAnimalsFailure extends GetAllAnimalsState {
  final String errMessage;
  const GetAllAnimalsFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
