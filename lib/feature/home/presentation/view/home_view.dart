import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/widgets/custom_loading_indecator.dart';
import 'package:animooo/feature/add_new_animal/domain/repos/animal_repo_decl.dart';
import 'package:animooo/feature/add_new_animal/presentation/manager/get_all_animals_cubit/get_all_animals_cubit.dart';
import 'package:animooo/feature/category/domain/repos/category_repo_decl.dart';
import 'package:animooo/feature/category/presentation/manager/get_all_category_cubit/get_all_category_cubit.dart';
import 'package:animooo/feature/home/presentation/manager/checker_cubit/checker_cubit.dart';
import 'package:animooo/feature/home/presentation/manager/see_all_button_cubit/sell_all_button_cubit.dart';
import 'package:animooo/feature/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllCategoryCubit(getit<CategoryRepoDecl>())..getAllCategory(),
        ),
        BlocProvider(create: (context) => SellAllButtonCubit()),
        BlocProvider(create: (context) => CheckerCubit()),
        BlocProvider(
          create: (context) =>
              GetAllAnimalsCubit(getit<AnimalRepoDecl>())..getAllAnimals(),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<GetAllCategoryCubit, GetAllCategoryState>(
          builder: (context, categoryState) {
            return BlocBuilder<GetAllAnimalsCubit, GetAllAnimalsState>(
              builder: (context, animalState) {
                if (categoryState is GetAllCategoryLoading ||
                    animalState is GetAllAnimalsLoading) {
                  return const CustomLoadingIndecator();
                }

                if (categoryState is GetAllCategoryFailure) {
                  return Center(child: Text(categoryState.errMessage));
                }

                if (animalState is GetAllAnimalsFailure) {
                  return Center(child: Text(animalState.errMessage));
                }

                if (categoryState is GetAllCategorySuccess &&
                    animalState is GetAllAnimalsSuccess) {
                  return HomeViewBody(
                    categories: categoryState.categories,
                    animals: animalState.animals,
                  );
                }

                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
