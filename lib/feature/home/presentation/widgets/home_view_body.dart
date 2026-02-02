import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/feature/home/presentation/manager/checker_cubit/checker_cubit.dart';
import 'package:animooo/feature/home/presentation/manager/see_all_button_cubit/sell_all_button_cubit.dart';
import 'package:animooo/feature/home/presentation/widgets/animals_continer_list_view.dart';
import 'package:animooo/feature/home/presentation/widgets/categories_list_view.dart';
import 'package:animooo/feature/home/presentation/widgets/category_and_add_new_category.dart';
import 'package:animooo/feature/home/presentation/widgets/hello_in_app.dart';
import 'package:animooo/feature/home/presentation/widgets/see_all_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.categories,
    required this.animals,
  });
  final List<GetAllCategoryEntity> categories;
  final List<GetAllAnimalEntity> animals;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder<List<GetAllAnimalEntity>>(
        valueListenable: getit<HomeController>().animalsNotifier,
        builder: (context, value, child) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.h4)),
              const SliverToBoxAdapter(child: HeloInApp()),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.h24)),
          
              SliverToBoxAdapter(
                child: CategoryAndAddnewCategory(
                  length: categories.length,
                  text: AppStrings.kAddNewCategory.tr(),
                  bigText: AppStrings.kCategories.tr(),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.h22)),
          
              SliverToBoxAdapter(
                child: BlocBuilder<SellAllButtonCubit, SellAllButtonState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: CategoriesListView(
                            animals: animals,
                            categories: categories,
                            clickOnSeeAll: context
                                .read<SellAllButtonCubit>()
                                .clickOnSeeAll,
                          ),
                        ),
                        Visibility(
                          visible: !context
                              .read<SellAllButtonCubit>()
                              .clickOnSeeAll,
                          child: SeeAllButton(
                            onPressed: context
                                .read<SellAllButtonCubit>()
                                .onSeeAllPressed,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.h13)),
          
              BlocBuilder<CheckerCubit, CheckerState>(
                builder: (context, state) {
                  final animalsToShow = state is CheckerFilterd
                      ? state.filterdAnimals
                      : animals;
          
                  return SliverMainAxisGroup(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            CategoryAndAddnewCategory(
                              length: animalsToShow.length,
                              text: AppStrings.kAddNewAnimal.tr(),
                              bigText: AppStrings.kAllAnimal.tr(),
                            ),
                            SizedBox(height: AppSpacing.h13),
                          ],
                        ),
                      ),
          
                      AnimalsContinerSliverListView(animals: animalsToShow),
                    ],
                  );
                },
              ),
            ],
          );
        }
      ),
    );
  }
}
