import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/feature/add_new_animal/domain/entities/add_new_animal_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AnimalRepoDecl {
  Future<Either<Failure, AddNewAnimalEntity>> addNewAnimal(
    AddNewAnimalEntity entity,
    int id,
  );
  Future<Either<Failure, List<GetAllAnimalEntity>>> getAllAnimal();
}
