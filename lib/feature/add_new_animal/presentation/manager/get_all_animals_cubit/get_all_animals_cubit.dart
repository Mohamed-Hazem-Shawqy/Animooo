import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/feature/add_new_animal/domain/repos/animal_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_animals_state.dart';

class GetAllAnimalsCubit extends Cubit<GetAllAnimalsState> {
  GetAllAnimalsCubit(this.animalRepoDecl) : super(GetAllAnimalsInitial());
  final AnimalRepoDecl animalRepoDecl;

  Future<void> getAllAnimals() async {
    emit(GetAllAnimalsLoading());
    final result = await animalRepoDecl.getAllAnimal();
    result.fold((l) => emit(GetAllAnimalsFailure(errMessage: l.toString())), (
      r,
    ) {
     
      emit(GetAllAnimalsSuccess(animals: r));
    });
  }
}
