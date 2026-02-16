import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/feature/home/domain/repos/home_animal_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_animal_state.dart';

class UpdateAnimalCubit extends Cubit<UpdateAnimalState> {
  UpdateAnimalCubit(this.homeAnimalRepoDecl) : super(UpdateAnimalInitial());
  final HomeAnimalRepoDecl homeAnimalRepoDecl;
  Future<void> updateAnimal(GetAllAnimalEntity animal) async {
    emit(UpdateAnimalLoading());
    final result = await homeAnimalRepoDecl.updateAnimal(animal);
    result.fold(
      (failure) => emit(UpdateAnimalFailure(failure.errMessage)),
      (animal) => emit(UpdateAnimalSuccess(animal)),
    );
  }
}
