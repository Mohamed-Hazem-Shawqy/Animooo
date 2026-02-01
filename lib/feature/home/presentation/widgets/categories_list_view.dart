import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/category/domain/entities/get_all_category_entity.dart';
import 'package:animooo/feature/home/presentation/widgets/categories.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.categories, required this.clickOnSeeAll});
  final List<GetAllCategoryEntity> categories;
  final bool clickOnSeeAll ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.h100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            Categories(category: categories[index]),

        itemCount: clickOnSeeAll ? categories.length : 3,
      ),
    );
  }
}
