import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/feature/category/domain/entities/create_new_category_entity.dart';
import 'package:animooo/feature/category/domain/entities/get_all_category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepoDecl {
  Future<Either<Failure, CreateNewCategoryEntity>> createNewCategory(
    CreateNewCategoryEntity categoryEntity,

  );
  Future<Either<Failure, List<GetAllCategoryEntity>>> getAllCategories();
}
