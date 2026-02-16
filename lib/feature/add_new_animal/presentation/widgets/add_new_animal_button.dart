import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/core/helper_function/get_category_id_by_name.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/services/pick_image.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_navigation.dart';
import 'package:animooo/core/widgets/custom_button.dart';
import 'package:animooo/core/widgets/custom_snackbar.dart';
import 'package:animooo/feature/add_new_animal/domain/entities/add_new_animal_entity.dart';
import 'package:animooo/feature/add_new_animal/presentation/manager/add_new_animal_cubit/add_new_animal_cubit.dart';
import 'package:animooo/feature/home/presentation/manager/cubit/update_animal_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewAnimalButton extends StatelessWidget {
  const AddNewAnimalButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.categoryName,
    required this.categories,
    required this.aniamlNameController,
    required this.descriptionController,
    required this.animalPrice,
    this.updateAnimal,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController categoryName;
  final List<GetAllCategoryEntity> categories;
  final TextEditingController aniamlNameController;
  final TextEditingController descriptionController;
  final TextEditingController animalPrice;
  final GetAllAnimalEntity? updateAnimal;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateAnimalCubit, UpdateAnimalState>(
      listener: (context, state) {
        if (state is UpdateAnimalSuccess) {
          getit<HomeController>().updateAnimalInList(state.animal);

          snackBarSuccessFunction(context, 'Animal Updated Successfully');

          AppNavigation.pop(context);
        } else if (state is UpdateAnimalFailure) {
          snackBarErrorFunction(context, state.errorMessage);
        }
      },
      child: CustomButton(
        text: AppStrings.kSave.tr(),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final categoryId = getCategoryIdByName(
              categoryName.text,
              categories,
            );
            if (categoryId == null) {
  snackBarErrorFunction(context, 'Category not found');
  return;
}
            if (updateAnimal != null) {
              final updatedAnimal = GetAllAnimalEntity(
                animalid: updateAnimal!.animalid,
                name: aniamlNameController.text,
                description: descriptionController.text,
                price: double.parse(animalPrice.text),
                categoryid: categoryId,

                image: ImagePickerClass.fileImage?.path ?? updateAnimal!.image,
              );

              context.read<UpdateAnimalCubit>().updateAnimal(updatedAnimal);
              return;
            }
           
            await context.read<AddNewAnimalCubit>().addNewAnimal(
              AddNewAnimalEntity(
                animalName: aniamlNameController.text,
                description: descriptionController.text,
                animalPrice: double.parse(animalPrice.text),
                categoryImage: ImagePickerClass.fileImage!.path,
              ),
              categoryId,
            );

            final newAnimal = GetAllAnimalEntity(
              name: aniamlNameController.text,
              description: descriptionController.text,
              price: double.parse(animalPrice.text),
              image: ImagePickerClass.fileImage!.path,
              categoryid: categoryId,
            );

            getit<HomeController>().addAnimal(newAnimal);
            aniamlNameController.clear();
            descriptionController.clear();
            animalPrice.clear();
            categoryName.clear();
            _formKey.currentState?.reset();
          }
        },
      ),
    );
  }
}
