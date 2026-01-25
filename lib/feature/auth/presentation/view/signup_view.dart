import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/app_navigation.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/core/widgets/custom_snackbar.dart';
import 'package:animooo/feature/auth/data/model/user_model.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:animooo/feature/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:animooo/feature/auth/presentation/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getit<AuthRepoDecl>()),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state is SignUpAuthFailure) {
              snackBarErrorFunction(context, state.errMessage);
            } else if (state is SignUpAuthSuccess) {
              final userModel = UserResponseModel.fromEntity(
                state.signupEntity,
              );
              final email = userModel.email;

              snackBarSuccessFunction(
                context,
                "Signup Successful! Welcome ${state.signupEntity.firstName}",
              );
              AppNavigation.pushNamed(
                context,
                RouteName.otpRoute,
                arguments: OtpArgs(email: email, purpose: OtpPurpose.signUp),
              );
            }
          },
          builder: (context, state) {
            return SignUpViewBody(state: state);
          },
        ),
      ),
    );
  }
}
