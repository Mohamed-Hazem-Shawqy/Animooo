import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.imagesNoInternetConnectionImageSvg),
          SizedBox(height: AppSpacing.h14),
          Text(
            AppStrings.kNoInternet.tr(),
            style: AppFonts.urbanistMedium14.copyWith(
              color: AppColors.black000000,
            ),
          ),
          SizedBox(height: AppSpacing.h8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.w37),
            child: Text(
              AppStrings.kUnableToConnectTheInternet.tr(),
              style: AppFonts.urbanistRegular12.copyWith(
                color: AppColors.black000000,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
