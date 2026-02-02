import 'dart:developer';
import 'dart:io';

import 'package:animooo/core/database/api/end_points.dart';
import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/feature/category/data/models/create_new_category_model.dart';
import 'package:animooo/core/models/get_all_category_model.dart';
import 'package:animooo/feature/category/domain/entities/create_new_category_entity.dart';
import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/feature/category/domain/repos/category_repo_decl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoryRepoImpl implements CategoryRepoDecl {
  @override
  Future<Either<Failure, CreateNewCategoryEntity>> createNewCategory(
    CreateNewCategoryEntity categoryEntity,
  ) async {
    final CreateNewCategoryRequestModel model = CreateNewCategoryRequestModel(
      name: categoryEntity.name,
      image: File(categoryEntity.imagepath),
      description: categoryEntity.description,
    );
    try {
      final response = await getit.dioService.post(
        path: EndPoints.createNewCategory,
        data: model.toJson(),
      );
      final result = CreatNewCategoryModel.fromJson(response);
      return Right(result.toEntity());
    } on DioException catch (e) {
      log(e.toString());
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure("Unexpected error occurred ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<GetAllCategoryEntity>>>
  getAllCategories() async {
    try {
      final response = await getit.dioService.get(
        path: EndPoints.getAllCategory,
      );
      final List categoriesJson = response['Categories'];

      final result = categoriesJson
          .map((e) => GetAllCategoryModel.fromJson(e).toEntity())
          .toList();
      return Right(result);
    } on DioException catch (e) {
      log(e.toString());
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure('unexpected error occurred ${e.toString()}'));
    }
  }
}
