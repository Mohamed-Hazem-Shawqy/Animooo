import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:flutter/material.dart';

class HaveOrDontHaveAccount extends StatelessWidget {
  const HaveOrDontHaveAccount({
    super.key,
    required this.authType,
    required this.haveorNotHaveAccount,
    required this.onTap,
  });
  final String authType;
  final String haveorNotHaveAccount;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: haveorNotHaveAccount,
              style: AppFonts.poppinsMedium14.copyWith(
                color: AppColors.color828282,
              ),
            ),

            TextSpan(
              text: authType,
              style: AppFonts.poppinsSemiBold14.copyWith(
                color: AppColors.primary04332D,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
