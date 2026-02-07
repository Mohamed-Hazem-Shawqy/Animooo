import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/services/pick_image.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/widgets/custom_button.dart';
import 'package:animooo/feature/category/domain/entities/create_new_category_entity.dart';
import 'package:animooo/feature/category/presentation/manager/category_cubit/create_new_category_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCategoryButton extends StatelessWidget {
  const AddNewCategoryButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.descriptionController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: AppStrings.kSave.tr(),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<CreateNewCategoryCubit>().createNewCategory(
            CreateNewCategoryEntity(
              name: nameController.text.trim(),
              description: descriptionController.text.trim(),
              imagepath: ImagePickerClass.fileImage!.path,
            ),
          );
          final newCategory = GetAllCategoryEntity(
            name: nameController.text,
            description: descriptionController.text,
            image: ImagePickerClass.fileImage!.path, 
            
          );
          getit<HomeController>().addCategory(newCategory);
          nameController.clear();
          descriptionController.clear();
          ImagePickerClass.fileImage = null;
          _formKey.currentState?.reset();
        }
      },
    );
  }
}
