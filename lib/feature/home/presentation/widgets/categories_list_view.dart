import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/home/presentation/widgets/categories.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.h100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Categories(),

        itemCount: 3,
      ),
    );
  }
}
