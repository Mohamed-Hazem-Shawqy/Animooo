import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_navigation.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: TextButton.styleFrom(overlayColor: Colors.transparent),
          onPressed: () {
            AppNavigation.pushNamed(context, RouteName.forgetYourPasswordRoute);
          },
          child: Text(
            AppStrings.kForgetPassword.tr(),
            style: AppFonts.poppinsMedium10.copyWith(
              color: AppColors.primary04332D,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
