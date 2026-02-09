import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/feature/add_new_animal/presentation/manager/get_all_animals_cubit/get_all_animals_cubit.dart';
import 'package:animooo/feature/category/presentation/manager/get_all_category_cubit/get_all_category_cubit.dart';
import 'package:animooo/feature/search/presentation/widgets/select_aniaml_orcategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  List<GetAllAnimalEntity> allAnimals = [];
  List<GetAllCategoryEntity> allCategories = [];

  List<GetAllAnimalEntity> filteredAnimals = [];
  List<GetAllCategoryEntity> filteredCategories = [];

  @override
  void initState() {
    super.initState();

    context.read<GetAllAnimalsCubit>().getAllAnimals();
    context.read<GetAllCategoryCubit>().getAllCategory();
  }

  void updateSearch(String value) {
    final query = value.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        filteredAnimals.clear();
        filteredCategories.clear();
      });
      return;
    }

    setState(() {
      filteredAnimals = allAnimals
          .where((a) => a.name.toLowerCase().contains(query))
          .toList();

      filteredCategories = allCategories
          .where((c) => c.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GetAllAnimalsCubit, GetAllAnimalsState>(
          listener: (context, state) {
            if (state is GetAllAnimalsSuccess) {
              allAnimals = state.animals;
              filteredAnimals = state.animals;
              setState(() {});
            }
          },
        ),
        BlocListener<GetAllCategoryCubit, GetAllCategoryState>(
          listener: (context, state) {
            if (state is GetAllCategorySuccess) {
              allCategories = state.categories;
              filteredCategories = state.categories;
              setState(() {});
            }
          },
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 14),

            TextField(
              onChanged: updateSearch,
              cursorColor: AppColors.primary04332D,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 8),
            const SelectAnimalorCategory(),
            const SizedBox(height: 8),

            Expanded(
              child: ListView(
                children: [
                  if (filteredCategories.isNotEmpty)
                    ...filteredCategories.map(
                      (c) => ListTile(title: Text(c.name)),
                    ),

                  if (filteredAnimals.isNotEmpty)
                    ...filteredAnimals.map(
                      (a) => ListTile(title: Text(a.name)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
