import 'package:animooo/core/app_navigation.dart';
import 'package:animooo/core/utils/app_consts.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/feature/auth/presentation/widgets/have_dont_have_account.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HaveOrDontHaveAccount(
        authType: AppStrings.kLogin.tr(),
        haveorNotHaveAccount: AppStrings.kHaveAnAccount.tr(),
        onTap: () {
         AppNavigation.pushNamedAndRemoveUntil(context, RouteName.loginRoute);
        },
      ),
    );
  }
}
