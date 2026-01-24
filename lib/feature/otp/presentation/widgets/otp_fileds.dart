import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpFileds extends StatelessWidget {
  const OtpFileds({super.key, required this.otpController});
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      separatorBuilder: (index) => SizedBox(width: AppSpacing.w18),
      autofocus: true,
      length: 5,
      controller: otpController,

      defaultPinTheme: PinTheme(
        width: AppSpacing.w54,
        height: AppSpacing.h53,
        textStyle: AppFonts.otamaRegular20.copyWith(
          color: AppColors.primary04332D,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.colorD6D6D6),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),

      focusedPinTheme: PinTheme(
        width: AppSpacing.w54,
        height: AppSpacing.h53,
        textStyle: AppFonts.otamaRegular20.copyWith(
          color: AppColors.primary04332D,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary04332D),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      errorPinTheme: PinTheme(
        width: AppSpacing.w54,
        height: AppSpacing.h53,
        textStyle: AppFonts.otamaRegular20.copyWith(color: AppColors.redFC1C1A),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.redFC1C1A),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
