import 'package:animooo/core/helper_function/appbar_func.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_navigation.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/core/widgets/custom_snackbar.dart';
import 'package:animooo/feature/otp/presentation/manager/counter_cubit/counter_cubit.dart';
import 'package:animooo/feature/otp/domain/repos/otp_repo_decl.dart';
import 'package:animooo/feature/otp/presentation/manager/otp_verification_cubit/otp_verification_cubit.dart';
import 'package:animooo/feature/otp/presentation/manager/send_new_otp_cubit/send_new_otp_cubit.dart';
import 'package:animooo/feature/otp/presentation/widgets/otp_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OtpVerificationCubit(getit<OtpRepoDecl>()),
        ),
        BlocProvider(
          create: (context) => SendNewOtpCubit(getit<OtpRepoDecl>()),
        ),
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: Scaffold(
        appBar: appBarFunc(context, AppStrings.kCancel.tr()),
        body: BlocConsumer<OtpVerificationCubit, OtpVerificationState>(
          listener: (context, state) {
            if (state is OtpVerificationSuccess) {
              snackBarSuccessFunction(context, 'Verication Successful');
              AppNavigation.pushNamedAndRemoveUntil(
                context,
                RouteName.loginRoute,
              );
            } else if (state is OtpVerificationFailure) {
              snackBarErrorFunction(
                context,
                'Verication Failed please check your email and try again!',
              );
            }
          },
          builder: (context, state) {
            return OtpViewBody(email: email);
          },
        ),
      ),
    );
  }
}
