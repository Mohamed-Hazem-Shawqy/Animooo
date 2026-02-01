import 'package:animooo/core/helper_function/new_category_and_animal_appbar.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/widgets/custom_loading_indecator.dart';
import 'package:animooo/core/widgets/custom_snackbar.dart';
import 'package:animooo/feature/category/domain/repos/category_repo_decl.dart';
import 'package:animooo/feature/category/presentation/manager/category_cubit/create_new_category_cubit.dart';
import 'package:animooo/feature/category/presentation/widget/add_new_category_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNewCategoryView extends StatelessWidget {
  const AddNewCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNewCategoryCubit(getit<CategoryRepoDecl>()),
      child: Scaffold(
        appBar: newCategoryAndAnimalAppBar(AppStrings.kAddNewCategory.tr()),
        body: SafeArea(
          child:
              BlocConsumer<CreateNewCategoryCubit, CreateNewCategoryCubitState>(
                listener: (context, state) {
                  if (state is CreateNewCategoryCubitStateSuccess) {
                    snackBarSuccessFunction(
                      context,
                      'Category created successfully',
                    );
                  } else if (state is CreateNewCategoryCubitStateFailure) {
                    snackBarErrorFunction(context, 'category creation failed');
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall: state is CreateNewCategoryCubitStateLoading,
                    progressIndicator: const CustomLoadingIndecator(),
                    child: const AddNewCategoryViewBody(),
                  );
                },
              ),
        ),
      ),
    );
  }
}
