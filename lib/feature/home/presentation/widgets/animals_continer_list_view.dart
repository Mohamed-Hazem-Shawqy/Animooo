import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/home/presentation/widgets/aniamls_container.dart';
import 'package:animooo/feature/home/presentation/widgets/skeltonizer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimalsContinerSliverListView extends StatelessWidget {
  const AnimalsContinerSliverListView({super.key, required this.animals, required this.isLoading});
  final List<GetAllAnimalEntity> animals;
final bool isLoading;
  @override
  Widget build(BuildContext context) {
     
    return SliverList.separated(
      itemCount:isLoading ? 4 : animals.isEmpty ? 1 : animals.length,
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.h17),
      itemBuilder: (context, index) =>isLoading ? const SkeltonizerContainer() : animals.isEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.w150),
              child: Column(
                children: [
                  SvgPicture.asset(Assets.imagesNoitemSvg),
                  Text('No animals '),
                ],
              ),
            )
          : AniamlsContainer(animal: animals[index]),
    );
  }
}
