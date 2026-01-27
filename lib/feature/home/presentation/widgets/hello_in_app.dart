import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeloInApp extends StatelessWidget {
  const HeloInApp({
    super.key,
  });

  @override

  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: AppSpacing.w17),
        SvgPicture.asset(Assets.imagesLogoSvg),
        SizedBox(width: AppSpacing.w24),
    
        Text(
          '${AppStrings.kHelloIn.tr()} ANIMOOO',
          style: AppFonts.originalSurfer24.copyWith(
            color: AppColors.primary04332D,
          ),
        ),
      ],
    );
  }
}
