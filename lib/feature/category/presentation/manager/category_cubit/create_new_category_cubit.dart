import 'package:animooo/feature/category/domain/entities/create_new_category_entity.dart';
import 'package:animooo/feature/category/domain/repos/category_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_new_category_cubit_state.dart';

class CreateNewCategoryCubit extends Cubit<CreateNewCategoryCubitState> {
  CreateNewCategoryCubit(this._categoryRepoDecl)
    : super(CreateNewCategoryCubitStateInitial());
  final CategoryRepoDecl _categoryRepoDecl;

  Future<void> createNewCategory(CreateNewCategoryEntity categoryEntity) async {
    emit(CreateNewCategoryCubitStateLoading());
    final result = await _categoryRepoDecl.createNewCategory(categoryEntity);
    result.fold(
      (l) => emit(CreateNewCategoryCubitStateFailure(l.toString())),
      (r) => emit(CreateNewCategoryCubitStateSuccess(r)),
    );
  }
}

class CategoryCubitSuccess {}

class CategoryCubitFailure {}

class CategoryCubitLoading {}
