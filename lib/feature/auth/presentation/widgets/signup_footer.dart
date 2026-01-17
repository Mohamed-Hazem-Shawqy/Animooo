import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/feature/auth/presentation/widgets/dont_have_account.dart';
import 'package:flutter/material.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HaveOrDontHaveAccount(
        authType: "login",
        haveorNotHaveAccount: "haveanaccount",
        onTap: () {
          Navigator.pushReplacementNamed(context, RouteName.loginRoute);
        },
      ),
    );
  }
}
