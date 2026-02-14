import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/feature/search/presentation/widgets/select_aniaml_orcategory.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
    required this.selectedType,
    required this.filteredCategories,
    required this.filteredAnimals,
  });

  final SelectionType selectedType;
  final List<GetAllCategoryEntity> filteredCategories;
  final List<GetAllAnimalEntity> filteredAnimals;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (selectedType == SelectionType.category)
          if (filteredCategories.isEmpty)
            const Center(child: Text('no category found'))
          else
            ...filteredCategories.map((c) => ListTile(title: Text(c.name))),

        if (selectedType == SelectionType.animal)
          if (filteredAnimals.isEmpty)
            const Center(child: Text('no animal found'))
          else
            ...filteredAnimals.map((a) => ListTile(title: Text(a.name))),
      ],
    );
  }
}
