import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/home/presentation/widgets/aniamls_container.dart';
import 'package:flutter/material.dart';

class AnimalsContinerSliverListView extends StatelessWidget {
  const AnimalsContinerSliverListView({super.key, required this.animals});
  final List<GetAllAnimalEntity> animals;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: animals.length,
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.h17),
      itemBuilder: (context, index) => AniamlsContainer(animal: animals[index]),
    );
  }
}
