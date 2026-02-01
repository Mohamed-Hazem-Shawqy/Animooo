import 'package:animooo/core/helper_function/new_category_and_animal_appbar.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/feature/add_new_animal/presentation/widgets/add_new_animal_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddNewAnimalView extends StatelessWidget {
  const AddNewAnimalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newCategoryAndAnimalAppBar(AppStrings.kAddNewAnimal.tr()),
      body: const AddNewAnimalViewBody(),
    );
    
  }
}
