import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:flutter/material.dart';

class OtpVerifiayNameAndHintText extends StatelessWidget {
  const OtpVerifiayNameAndHintText({
    super.key,
    required this.headlinetext,
    required this.text,
  });
  final String headlinetext;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headlinetext,
          style: AppFonts.otamaRegular20.copyWith(
            color: AppColors.primary04332D,
          ),
        ),
        SizedBox(height: AppSpacing.h6),
        Text(
          text,
          style: AppFonts.interRegular14.copyWith(
            color: AppColors.color212529.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
