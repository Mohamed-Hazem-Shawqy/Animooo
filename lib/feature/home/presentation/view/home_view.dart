import 'package:animooo/core/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/feature/add_new_animal/domain/repos/animal_repo_decl.dart';
import 'package:animooo/feature/add_new_animal/presentation/manager/get_all_animals_cubit/get_all_animals_cubit.dart';
import 'package:animooo/feature/category/domain/repos/category_repo_decl.dart';
import 'package:animooo/feature/category/presentation/manager/get_all_category_cubit/get_all_category_cubit.dart';
import 'package:animooo/feature/home/presentation/manager/checker_cubit/checker_cubit.dart';
import 'package:animooo/feature/home/presentation/manager/see_all_button_cubit/sell_all_button_cubit.dart';
import 'package:animooo/feature/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllCategoryCubit(
            getit<CategoryRepoDecl>(),
            internetConnectionCubit: getit<InternetConnectionCubit>(),
          )..getAllCategory(),
        ),
        BlocProvider(create: (context) => SellAllButtonCubit()),
        BlocProvider(create: (context) => CheckerCubit()),
        BlocProvider(
          create: (context) => GetAllAnimalsCubit(
            getit<AnimalRepoDecl>(),
            internetConnectionCubit: getit<InternetConnectionCubit>(),
          )..getAllAnimals(),
        ),
      ],
      child:const HomeScaffoldContent()
        
      
    );
  }
}

class HomeScaffoldContent extends StatelessWidget {
  const HomeScaffoldContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GetAllCategoryCubit, GetAllCategoryState>(
        listener: (context, state) {
          if (state is GetAllCategorySuccess) {
            getit<HomeController>().updatedCategories(state.categories);
          }
        },
        builder: (context, categoryState) {
          return BlocConsumer<GetAllAnimalsCubit, GetAllAnimalsState>(
            listener: (context, state) {
              if (state is GetAllAnimalsSuccess) {
                getit<HomeController>().updatedAnimals(state.animals);
              }
            },
            builder: (context, animalState) {
              final isLoading =
                  categoryState is GetAllCategoryLoading ||
                  animalState is GetAllAnimalsLoading;

              if (categoryState is GetAllCategoryLoading ||
                  animalState is GetAllAnimalsLoading) {
                return Skeletonizer(
                  enabled: true,
                  child: HomeViewBody(isLoading: isLoading),
                );
              }

              if (categoryState is GetAllCategoryFailure) {
                return Center(child: Text(categoryState.errMessage));
              }

              if (animalState is GetAllAnimalsFailure) {
                return Center(child: Text(animalState.errMessage));
              }

              if (categoryState is GetAllCategorySuccess &&
                  animalState is GetAllAnimalsSuccess) {
                return HomeViewBody(isLoading: isLoading);
              }

              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
