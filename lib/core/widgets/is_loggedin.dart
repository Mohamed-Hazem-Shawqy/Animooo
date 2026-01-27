import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/singletoon/shared_pref_singletoon.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/feature/auth/presentation/view/login_view.dart';
import 'package:animooo/feature/nav_bar/presentation/view/nav_bar_view.dart';
import 'package:flutter/material.dart';

class IsLoggedin extends StatelessWidget {
  const IsLoggedin({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = getit<SharedPrefSingletoon>();
    final isLoggedIn = prefs.getBool(AppStrings.kisloggedin) ?? false;

    if (isLoggedIn) {
      return const NavBarView();
    } else {
      return const LoginView();
    }
  }
}
