import 'dart:async';

import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/feature/add_new_animal/presentation/manager/get_all_animals_cubit/get_all_animals_cubit.dart';
import 'package:animooo/feature/category/presentation/manager/get_all_category_cubit/get_all_category_cubit.dart';
import 'package:animooo/feature/search/presentation/widgets/search_body.dart';
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
  Timer? _debounce;
  bool searching = false;
  SelectionType selectedType = SelectionType.category;
  @override
  void initState() {
    context.read<GetAllCategoryCubit>().getAllCategory();
    super.initState();
  }

  void updateSearch(String value) {
    if (_debounce?.isActive == true) _debounce?.cancel();

    setState(() {
      searching = true;
    });

    _debounce = Timer(const Duration(seconds: 2), () {
      if (value.toLowerCase().isEmpty) {
        setState(() {
          searching = false;
          filteredAnimals.clear();
          filteredCategories.clear();
        });
        return;
      }

      setState(() {
        if (selectedType == SelectionType.category) {
          filteredCategories = allCategories
              .where((c) => c.name.toLowerCase().contains(value.toLowerCase()))
              .toList();

          filteredAnimals.clear();
        } else {
          filteredAnimals = allAnimals
              .where((a) => a.name.toLowerCase().contains(value.toLowerCase()))
              .toList();

          filteredCategories.clear();
        }

        searching = false;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
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
            }
          },
        ),
        BlocListener<GetAllCategoryCubit, GetAllCategoryState>(
          listener: (context, state) {
            if (state is GetAllCategorySuccess) {
              allCategories = state.categories;
              filteredCategories = state.categories;
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
            SelectAnimalorCategory(
              isSelected: selectedType,
              onSelected: (SelectionType type) {
                setState(() {
                  selectedType = type;
                  filteredAnimals.clear();
                  filteredCategories.clear();
                });
                if (type == SelectionType.animal) {
                  context.read<GetAllAnimalsCubit>().getAllAnimals();
                }
              },
            ),
            const SizedBox(height: 8),

            searching
                ? const Center(child: Text('loading...'))
                : Expanded(
                    child: SearchBody(
                      selectedType: selectedType,
                      filteredCategories: filteredCategories,
                      filteredAnimals: filteredAnimals,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

