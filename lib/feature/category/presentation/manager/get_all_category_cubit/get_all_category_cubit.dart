import 'package:animooo/core/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/feature/category/domain/repos/category_repo_decl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_category_state.dart';

class GetAllCategoryCubit extends Cubit<GetAllCategoryState> {
  GetAllCategoryCubit(this.categoryRepoDecl, {required this.internetConnectionCubit}) : super(GetAllCategoryInitial());
  final CategoryRepoDecl categoryRepoDecl;
  final InternetConnectionCubit internetConnectionCubit ;
  Future<void> getAllCategory() async {
    if (internetConnectionCubit.state is InternetConnectionStateDisconnected) return;
    if (state is GetAllCategoryLoading) return;
    emit(GetAllCategoryLoading());
    final result = await categoryRepoDecl.getAllCategories();
    result.fold(
      (l) => emit(GetAllCategoryFailure(errMessage: l.toString())),
      (r) => emit(GetAllCategorySuccess(categories: r)),
    );
  }
}
