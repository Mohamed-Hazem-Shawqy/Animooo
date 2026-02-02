import 'package:animooo/core/helper_function/new_category_and_animal_appbar.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/widgets/custom_loading_indecator.dart';
import 'package:animooo/core/widgets/custom_snackbar.dart';
import 'package:animooo/feature/add_new_animal/domain/repos/animal_repo_decl.dart';
import 'package:animooo/feature/add_new_animal/presentation/manager/add_new_animal_cubit/add_new_animal_cubit.dart';
import 'package:animooo/feature/add_new_animal/presentation/widgets/add_new_animal_view_body.dart';
import 'package:animooo/feature/category/domain/repos/category_repo_decl.dart';
import 'package:animooo/feature/category/presentation/manager/get_all_category_cubit/get_all_category_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNewAnimalView extends StatelessWidget {
  const AddNewAnimalView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNewAnimalCubit(getit<AnimalRepoDecl>()),
        ),
        BlocProvider(create: (context) => GetAllCategoryCubit(getit<CategoryRepoDecl>())..getAllCategory()),
      ],
      child: Scaffold(
        appBar: newCategoryAndAnimalAppBar(AppStrings.kAddNewAnimal.tr()),
        body: BlocConsumer<AddNewAnimalCubit, AddNewAnimalState>(
          listener: (context, state) {
            if (state is AddNewAnimalSuccess) {
              snackBarSuccessFunction(context, 'Animal Added Successfully');
            } else if (state is AddNewAnimalFailure) {
              snackBarErrorFunction(context, 'Animal Adding Failed');
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNewAnimalLoading,
              progressIndicator: const CustomLoadingIndecator(),
              child: const AddNewAnimalViewBody(),
            );
          },
        ),
      ),
    );
  }
}
