import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/widgets/custom_button.dart';
import 'package:animooo/feature/otp/presentation/widgets/otp_fileds.dart';
import 'package:animooo/feature/otp/presentation/widgets/otp_verifiay_name_and_hint_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.h16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSpacing.h17),
          const OtpVerifiayNameAndHintText(),
          SizedBox(height: AppSpacing.h54),
          const OtpFileds(),
          SizedBox(height: AppSpacing.h41),
          CustomButton(text: AppStrings.kConfirm.tr(), onPressed: () {}),
          SizedBox(height: AppSpacing.h6),
          Center(
            child: Text(
              AppStrings.kResendCode.tr(),
              style: AppFonts.interRegular12.copyWith(
                color: AppColors.color180901,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
