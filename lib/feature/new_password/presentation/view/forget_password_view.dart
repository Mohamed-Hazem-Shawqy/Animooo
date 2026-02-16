import 'package:animooo/core/helper_function/appbar_func.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_navigation.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/core/widgets/custom_snackbar.dart';
import 'package:animooo/feature/new_password/domain/repos/forget_and_create_new_password_decl.dart';
import 'package:animooo/feature/new_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:animooo/feature/new_password/presentation/widgets/forget_password_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ForgetPasswordCubit(getit<ForgetAndCreateNewPasswordDecl>()),
      child: Scaffold(
        appBar: appBarFunc(context, AppStrings.kBack.tr(),),
        body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordFailure) {
              snackBarErrorFunction(context, state.message);
            } else if (state is ForgetPasswordSuccess) {
              snackBarSuccessFunction(context, state.message);
      
              AppNavigation.pushNamed(
                context,
                RouteName.otpRoute,
                arguments: OtpArgs(
                  email: state.email,
                  purpose: OtpPurpose.forgetPassword,
                ),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is ForgetPasswordLoading,
              progressIndicator: const CircularProgressIndicator(),
              child: ForgetPasswordViewBody(),
            );
          },
        ),
      ),
    );
  }
}
