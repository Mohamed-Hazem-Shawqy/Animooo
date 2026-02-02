import 'package:animooo/core/entity/get_all_category_entity.dart';
import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/validators/public_validator.dart';
import 'package:animooo/core/widgets/custom_form_text_field.dart';
import 'package:animooo/core/widgets/filed_name.dart';
import 'package:animooo/core/widgets/upload_image.dart';
import 'package:animooo/core/widgets/name_and_puplic.dart';
import 'package:animooo/feature/add_new_animal/presentation/widgets/add_new_animal_button.dart';
import 'package:animooo/feature/category/presentation/manager/get_all_category_cubit/get_all_category_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewAnimalViewBody extends StatefulWidget {
  const AddNewAnimalViewBody({super.key, });

  @override
  State<AddNewAnimalViewBody> createState() => _AddNewAnimalViewBodyState();
}

class _AddNewAnimalViewBodyState extends State<AddNewAnimalViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController aniamlNameController;
  late TextEditingController descriptionController;
  late TextEditingController animalPrice;
  late TextEditingController categoryName;
  List<GetAllCategoryEntity> categories = [];

  @override
  void initState() {
    aniamlNameController = TextEditingController();
    descriptionController = TextEditingController();
    animalPrice = TextEditingController();
    categoryName = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    aniamlNameController.dispose();
    descriptionController.dispose();
    animalPrice.dispose();
    categoryName.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.w18),
      child: SingleChildScrollView(
        child: BlocBuilder<GetAllCategoryCubit, GetAllCategoryState>(
          builder: (context, state) {
            if (state is GetAllCategorySuccess) {
              categories = state.categories;
            }
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameAndPuplic(
                    
                    text: AppStrings.kPublic.tr(),
                    style: AppFonts.urbanistSemiBold12.copyWith(
                      color: AppColors.black000000,
                    ),
                  ),
                  SizedBox(height: AppSpacing.h20),

                  FieldName(filedName: AppStrings.kAnimalName.tr()),
                  SizedBox(height: AppSpacing.h6),

                  CustomFormTextField(
                    controller: aniamlNameController,
                    hintText: AppStrings.kEnteryourAnimalName.tr(),
                    validator: (value) => PublicValidator.call(value),
                  ),
                  SizedBox(height: AppSpacing.h8),
                  FieldName(filedName: AppStrings.kAnimalDescription.tr()),
                  SizedBox(height: AppSpacing.h6),
                  CustomFormTextField(
                    maxLines: 4,
                    controller: descriptionController,
                    hintText: AppStrings.kEnteryourDescription.tr(),
                    validator: (value) => PublicValidator.call(value),
                  ),
                  SizedBox(height: AppSpacing.h16),
                  UploadImage(
                    filedName: AppStrings.kUploadImageForYourAnimal.tr(),
                  ),
                  SizedBox(height: AppSpacing.h16),

                  FieldName(filedName: AppStrings.kAnimalPrice.tr()),
                  SizedBox(height: AppSpacing.h6),
                  CustomFormTextField(
                    controller: animalPrice,
                    hintText: AppStrings.kEnterYourAnimalPrice.tr(),
                    validator: (value) => PublicValidator.call(value),
                  ),
                  SizedBox(height: AppSpacing.h8),

                  FieldName(filedName: AppStrings.kCategoryName.tr()),
                  SizedBox(height: AppSpacing.h6),
                  CustomFormTextField(
                    controller: categoryName,
                    hintText: AppStrings.kEnteryourCategoryName.tr(),
                    validator: (value) => PublicValidator.call(value),
                  ),

                  SizedBox(height: AppSpacing.h33),
                  AddNewAnimalButton(
                    formKey: _formKey,
                    categoryName: categoryName,
                    categories: categories,
                    aniamlNameController: aniamlNameController,
                    descriptionController: descriptionController,
                    animalPrice: animalPrice,
                  ),
                  SizedBox(height: AppSpacing.h16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
