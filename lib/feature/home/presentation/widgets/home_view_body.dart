import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/home/presentation/widgets/animals_continer_list_view.dart';
import 'package:animooo/feature/home/presentation/widgets/categories_list_view.dart';
import 'package:animooo/feature/home/presentation/widgets/category_and_add_new_category.dart';
import 'package:animooo/feature/home/presentation/widgets/hello_in_app.dart';
import 'package:animooo/feature/home/presentation/widgets/see_all_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.h4)),
          const SliverToBoxAdapter(child: HeloInApp()),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.h24)),

          SliverToBoxAdapter(
            child: CategoryAndAddnewCategory(
              text: AppStrings.kAddNewCategory.tr(),
              bigText: AppStrings.kCategories.tr(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.h22)),

          const SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(child: CategoriesListView()),
                SeeAllButton(),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.h13)),

          SliverToBoxAdapter(
            child: CategoryAndAddnewCategory(
              text: AppStrings.kAddNewAnimal.tr(),
              bigText: AppStrings.kAllAnimal.tr(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.h13)),
          AnimalsContinerSliverListView(),
        ],
      ),
    );
  }
}
