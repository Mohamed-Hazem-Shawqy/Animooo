import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/feature/home/presentation/manager/checker_cubit/checker_cubit.dart';
import 'package:animooo/feature/home/presentation/widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categories,
    required this.clickOnSeeAll,
    required this.animals,
  });
  final List<GetAllCategoryEntity> categories;
  final List<GetAllAnimalEntity> animals;
  final bool clickOnSeeAll;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.h100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.read<CheckerCubit>().filterByCategory(
              categories[index].id,
              animals,
            );
          },
          child: Categories(category: categories[index], animals: animals),
        ),

        itemCount: clickOnSeeAll ? categories.length : 3,
      ),
    );
  }
}
