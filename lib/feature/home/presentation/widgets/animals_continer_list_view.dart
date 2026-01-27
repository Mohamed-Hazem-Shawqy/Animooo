import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/home/presentation/widgets/aniamls_container.dart';
import 'package:flutter/material.dart';

class AnimalsContinerSliverListView extends StatelessWidget {
  const AnimalsContinerSliverListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 3,
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.h17),
      itemBuilder: (context, index) => AniamlsContainer(),
    );
  }
}
