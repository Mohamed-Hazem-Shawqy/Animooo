import 'dart:developer';
import 'dart:io';

import 'package:animooo/core/database/api/end_points.dart';
import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/models/get_all_animal_model.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/feature/add_new_animal/data/models/add_new_animal_model.dart';
import 'package:animooo/feature/add_new_animal/domain/entities/add_new_animal_entity.dart';
import 'package:animooo/feature/add_new_animal/domain/repos/animal_repo_decl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AnimalRepoImpl implements AnimalRepoDecl {
  @override
  Future<Either<Failure, AddNewAnimalEntity>> addNewAnimal(
    AddNewAnimalEntity entity,
    int id,
  ) async {
    AddNewAnimalRequestModel addNewAnimalRequestModel =
        AddNewAnimalRequestModel(
          animalName: entity.animalName,
          animalPrice: entity.animalPrice,
          categoryId: id,
          description: entity.description,
          image: File(entity.categoryImage),
        );
    try {
      final response = await getit.dioService.post(
        path: EndPoints.addNewAnimal,
        data: addNewAnimalRequestModel.toMap(),
      );

      return right(AddNewAnimalModel.fromJson(response['Category']).toEntity());
    } on DioException catch (e) {
      log(e.toString());
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GetAllAnimalEntity>>> getAllAnimal() async{
    try {
      final response=await getit.dioService.get(path:   EndPoints.getAllAnimal);
      List animals=response['Animals'];
      final result=animals.map((e) => GetAllAnimalModel.fromJson(e).toEntity()).toList();
      return right(result);
    }on DioException catch (e) {
      log(e.toString());
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }


 
}
