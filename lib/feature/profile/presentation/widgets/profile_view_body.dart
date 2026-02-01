import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/widgets/name_and_puplic.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.w18),
      child: Column(
        children: [
          NameAndPuplic(
            text: AppStrings.kProfileDetails.tr(),
            style:  AppFonts.urbanistSemiBold28.copyWith(
                color: AppColors.black000000,
              ),
            radius: 48,
            width: 82,
          ),
        ],
      ),
    );
  }
}
