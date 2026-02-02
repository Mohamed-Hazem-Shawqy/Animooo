part of 'checker_cubit.dart';

abstract class CheckerState extends Equatable {
  const CheckerState();
  @override
  List<Object> get props => [];
}

class CheckerInitial extends CheckerState {}

class CheckerLoading extends CheckerState {}

class CheckerFilterd extends CheckerState {
  final List<GetAllAnimalEntity> filterdAnimals;

  const CheckerFilterd({required this.filterdAnimals});
  @override
  List<Object> get props => [filterdAnimals];
}
