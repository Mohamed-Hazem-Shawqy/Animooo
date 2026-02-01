import 'package:animooo/feature/category/domain/entities/get_all_category_entity.dart';
import 'package:animooo/feature/category/domain/repos/category_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_category_state.dart';

class GetAllCategoryCubit extends Cubit<GetAllCategoryState> {
  GetAllCategoryCubit(this.categoryRepoDecl) : super(GetAllCategoryInitial());
  final CategoryRepoDecl categoryRepoDecl;
  Future<void> getAllCategory() async {
    emit(GetAllCategoryLoading());
    final result = await categoryRepoDecl.getAllCategories();
    result.fold(
      (l) => emit(GetAllCategoryFailure(errMessage: l.toString())),
      (r) => emit(GetAllCategorySuccess(categories: r)),
    );
  }
}
