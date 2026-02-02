import 'package:animooo/core/services/pick_image.dart';
import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/validators/empty_img_validator.dart';
import 'package:animooo/core/validators/public_validator.dart';
import 'package:animooo/core/widgets/custom_button.dart';
import 'package:animooo/core/widgets/custom_form_text_field.dart';
import 'package:animooo/core/widgets/filed_name.dart';
import 'package:animooo/core/widgets/upload_image.dart';
import 'package:animooo/core/widgets/name_and_puplic.dart';
import 'package:animooo/feature/category/domain/entities/create_new_category_entity.dart';
import 'package:animooo/feature/category/presentation/manager/category_cubit/create_new_category_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCategoryViewBody extends StatefulWidget {
  const AddNewCategoryViewBody({super.key, });

  @override
  State<AddNewCategoryViewBody> createState() => _AddNewCategoryViewBodyState();
}

class _AddNewCategoryViewBodyState extends State<AddNewCategoryViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  @override
  void initState() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.w18),
      child: SingleChildScrollView(
        child:
            BlocListener<CreateNewCategoryCubit, CreateNewCategoryCubitState>(
              listener: (context, state) {
                if (state is CreateNewCategoryCubitStateSuccess) {
                  nameController.clear();
                  descriptionController.clear();
                  ImagePickerClass.fileImage = null;
                  _formKey.currentState?.reset();
                }
              },
              child: Form(
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

                    FieldName(filedName: AppStrings.kCategoryName.tr()),
                    SizedBox(height: AppSpacing.h6),

                    CustomFormTextField(
                      controller: nameController,
                      hintText: AppStrings.kEnteryourCategoryName.tr(),
                      validator: (value) => PublicValidator.call(value),
                    ),
                    SizedBox(height: AppSpacing.h8),
                    FieldName(filedName: AppStrings.kCategoryDescription.tr()),
                    SizedBox(height: AppSpacing.h6),
                    CustomFormTextField(
                      maxLines: 4,
                      controller: descriptionController,
                      hintText: AppStrings.kEnteryourDescription.tr(),
                      validator: (value) => PublicValidator.call(value),
                    ),
                    SizedBox(height: AppSpacing.h16),
                    UploadImage(
                      validator: (value) => EmptyImgValidator.call(value),
                      filedName: AppStrings.kUploadImageForYourCateogry.tr(),
                    ),
                    SizedBox(height: AppSpacing.h33),
                    CustomButton(
                      text: AppStrings.kSave.tr(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<CreateNewCategoryCubit>()
                              .createNewCategory(
                                CreateNewCategoryEntity(
                                  name: nameController.text.trim(),
                                  description: descriptionController.text
                                      .trim(),
                                  imagepath: ImagePickerClass.fileImage!.path,
                                ),
                              );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
