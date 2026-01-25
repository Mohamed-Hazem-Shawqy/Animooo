import 'dart:developer';

import 'package:animooo/core/helper_function/appbar_func.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_navigation.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/core/widgets/custom_snackbar.dart';
import 'package:animooo/feature/new_password/domain/repos/forget_and_create_new_password_decl.dart';
import 'package:animooo/feature/new_password/presentation/manager/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:animooo/feature/new_password/presentation/widgets/create_new_password_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    log('new password view $email');
    return BlocProvider(
      create: (context) =>
          CreateNewPasswordCubit(getit<ForgetAndCreateNewPasswordDecl>()),
      child: Scaffold(
        appBar: appBarFunc(context, AppStrings.kCancel.tr()),
        body: BlocConsumer<CreateNewPasswordCubit, CreateNewPasswordState>(
          listener: (context, state) {
            if (state is CreateNewPasswordFailure) {
              snackBarErrorFunction(context, state.errMessage);
            } else if (state is CreateNewPasswordSuccess) {
              snackBarSuccessFunction(context, 'Password Changed Successfully');
              AppNavigation.pushNamedAndRemoveUntil(
                context,
                RouteName.loginRoute,
              );
            }
          },
          builder: (context, state) {
            return CreateNewPasswordViewBody(state: state, email: email);
          },
        ),
      ),
    );
  }
}
