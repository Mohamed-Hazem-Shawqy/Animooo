import 'package:animooo/feature/home/domain/repos/home_animal_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_animal_state.dart';

class DeleteAnimalCubit extends Cubit<DeleteAnimalState> {
  DeleteAnimalCubit(this.homeAnimalRepoDecl) : super(DeleteAnimalInitial());
  final HomeAnimalRepoDecl homeAnimalRepoDecl;
  Future<void> deleteAnimal(int animalId) async {
    emit(DeleteAnimalLoading());
    final result = await homeAnimalRepoDecl.deleteAnimal(animalId);
    result.fold(
      (failure) => emit(DeleteAnimalFailure(failure.errMessage)),
      (_) => emit(DeleteAnimalSuccess(animalId)),
    );
  }
}
