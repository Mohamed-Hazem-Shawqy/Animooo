import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/feature/home/presentation/manager/checker_cubit/checker_cubit.dart';
import 'package:animooo/feature/home/presentation/widgets/categories.dart';
import 'package:animooo/feature/home/presentation/widgets/skeltonizer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categories,
    required this.clickOnSeeAll,
    required this.animals,
    required this.isLoading,
  });
  final List<GetAllCategoryEntity> categories;
  final List<GetAllAnimalEntity> animals;
  final bool clickOnSeeAll;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.h100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => isLoading
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const SkeltonizerCircleAvatar(),
              )
            : GestureDetector(
                onTap: () {
                  context.read<CheckerCubit>().filterByCategory(
                    categories[index].id ?? 0,
                    animals,
                  );
                },
                child: categories.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.w150,
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(Assets.imagesNoitemSvg),
                            Text('No categories yet'),
                          ],
                        ),
                      )
                    : Categories(category: categories[index], animals: animals),
              ),

        itemCount: isLoading
            ? 4
            : categories.isEmpty
            ? 1
            : clickOnSeeAll
            ? categories.length
            : categories.length > 3
            ? 3
            : categories.length,
      ),
    );
  }
}
