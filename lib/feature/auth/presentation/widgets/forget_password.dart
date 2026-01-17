import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
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