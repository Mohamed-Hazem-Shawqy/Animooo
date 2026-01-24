import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/widgets/custom_snackbar.dart';
import 'package:animooo/feature/auth/domain/repo_decl/auth_repo_decl.dart';
import 'package:animooo/feature/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:animooo/feature/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getit<AuthRepoDecl>()),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignInAuthSuccess) {
              snackBarSuccessFunction(context, "Login Successful");
            } else if (state is SignInAuthFailure) {
              snackBarErrorFunction(
                context,
                "Login Failed: ${state.errMessage}",
              );
            }
          },
          builder: (context, state) {
            return LoginViewBody(state: state);
          },
        ),
      ),
    );
  }
}
