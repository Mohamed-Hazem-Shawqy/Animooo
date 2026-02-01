import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key, this.onPressed});

final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppSpacing.w16, bottom: AppSpacing.h28),
      child: SizedBox(
        height: AppSpacing.h20,
        width: AppSpacing.w75,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            backgroundColor: AppColors.primary155F45,
          ),
          onPressed:onPressed,
          child: Text(
            AppStrings.kSeeAll.tr(),
            style: AppFonts.poppinsRegular8.copyWith(
              color: AppColors.whiteFFFFFF,
            ),
          ),
        ),
      ),
    );
  }
}
