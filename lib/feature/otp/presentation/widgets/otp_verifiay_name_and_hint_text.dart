import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OtpVerifiayNameAndHintText extends StatelessWidget {
  const OtpVerifiayNameAndHintText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [ Text(
       AppStrings.kOtpVerification.tr(),
       style: AppFonts.otamaRegular20.copyWith(
         color: AppColors.primary04332D,
       ),
     ),
     SizedBox(height: AppSpacing.h6),
     Text(
       AppStrings.kPleaseCheckYourEmailForOTP.tr(),
       style: AppFonts.interRegular14.copyWith(
         color: AppColors.color212529.withValues(alpha: 0.6),
       ),
     ),],);
  }
}
