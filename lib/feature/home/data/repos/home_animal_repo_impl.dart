import 'package:animooo/core/database/api/end_points.dart';
import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/models/get_all_animal_model.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/feature/home/domain/repos/home_animal_repo_decl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeAnimalRepoImpl implements HomeAnimalRepoDecl {
  @override
  Future<Either<Failure, Unit>> deleteAnimal(int animalId) async {
    try{
    await getit.dioService.delete(
      path: EndPoints.deleteAnimal,
      queryParameters: {'id': animalId},
    );
    return right( unit );}
    on DioException catch(e){
      return left(ServerFailure.fromDioException(e));
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetAllAnimalEntity>> updateAnimal(GetAllAnimalEntity animal) async{
    try{
      final response = await getit.dioService.post(path: EndPoints.updateAnimal, data: {
        'id': animal.animalid,
        'name': animal.name,
        'description': animal.description,
        'animal_image': animal.image,
        'animal_price': animal.price,
        'category_id': animal.categoryid,
        
      });
      return right(GetAllAnimalModel.fromJson(response['Animals']).toEntity());
    }on DioException catch(e){
      return left(ServerFailure.fromDioException(e));
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }
}
