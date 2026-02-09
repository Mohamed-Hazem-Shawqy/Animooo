import 'package:animooo/core/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/feature/add_new_animal/domain/repos/animal_repo_decl.dart';
import 'package:animooo/feature/add_new_animal/presentation/manager/get_all_animals_cubit/get_all_animals_cubit.dart';
import 'package:animooo/feature/category/domain/repos/category_repo_decl.dart';
import 'package:animooo/feature/category/presentation/manager/get_all_category_cubit/get_all_category_cubit.dart';
import 'package:animooo/feature/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GetAllAnimalsCubit(
              getit<AnimalRepoDecl>(),
              internetConnectionCubit: getit<InternetConnectionCubit>(),
            ),
          ),
          BlocProvider(
            create: (context) => GetAllCategoryCubit(
              getit<CategoryRepoDecl>(),
              internetConnectionCubit: getit<InternetConnectionCubit>(),
            ),
          ),
      ],
      child: Scaffold(body: SafeArea(child: const SearchViewBody())),
    );
  }
}
