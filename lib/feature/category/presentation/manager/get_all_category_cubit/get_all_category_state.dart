part of 'get_all_category_cubit.dart';

sealed class GetAllCategoryState extends Equatable {
  const GetAllCategoryState();

  @override
  List<Object> get props => [];
}

final class GetAllCategoryInitial extends GetAllCategoryState {}

final class GetAllCategoryLoading extends GetAllCategoryState {}

final class GetAllCategorySuccess extends GetAllCategoryState {
  final List<GetAllCategoryEntity> categories;

  const GetAllCategorySuccess({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class GetAllCategoryFailure extends GetAllCategoryState {
  final String errMessage;

  const GetAllCategoryFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
