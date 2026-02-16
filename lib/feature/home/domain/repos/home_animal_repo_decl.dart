import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/errors/failuer.dart';
import 'package:dartz/dartz.dart';

abstract class HomeAnimalRepoDecl {
  Future<Either<Failure, Unit>> deleteAnimal(int animalId);
  Future<Either<Failure, GetAllAnimalEntity>> updateAnimal(GetAllAnimalEntity animal);
}
