import 'package:equatable/equatable.dart';
import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checker_state.dart';

class CheckerCubit extends Cubit<CheckerState> {
  CheckerCubit() : super(CheckerInitial());

  void filterByCategory(int categoryId, List<GetAllAnimalEntity> allAnimals) {
    final filtered = allAnimals
        .where((animal) => animal.categoryid == categoryId)
        .toList();

    emit(CheckerFilterd(filterdAnimals: filtered));
  }
}
