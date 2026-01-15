import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary04332D,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppFonts.poppinsRegular14.copyWith(
            color: AppColors.whiteFFFFFF,
          ),
        ),
      ),
    );
  }
}
