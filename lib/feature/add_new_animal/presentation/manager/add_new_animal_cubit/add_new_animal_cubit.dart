
import 'package:animooo/feature/add_new_animal/domain/entities/add_new_animal_entity.dart';
import 'package:animooo/feature/add_new_animal/domain/repos/animal_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_new_animal_state.dart';

class AddNewAnimalCubit extends Cubit<AddNewAnimalState> {
  AddNewAnimalCubit(this.animalRepoDecl) : super(AddNewAnimalInitial());
  final AnimalRepoDecl animalRepoDecl;

  Future<void> addNewAnimal(AddNewAnimalEntity entity, int id) async {
    emit(AddNewAnimalLoading());
    final result = await animalRepoDecl.addNewAnimal(entity, id);
    result.fold((l) => emit(AddNewAnimalFailure(errMessage: l.toString())), (
      r,
    ) {
      emit(AddNewAnimalSuccess(addNewAnimalEntity: r));
    });
  }
}
