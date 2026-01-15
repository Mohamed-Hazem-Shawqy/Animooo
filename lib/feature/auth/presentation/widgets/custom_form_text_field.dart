import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.controller,
  });

  final bool obscureText;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'thisFiledRequired'.tr();
        }
        return null;
      },
      controller: controller,
      cursorColor: AppColors.darkTeal05332E,
      obscuringCharacter: '*',

      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.steelGreyAlt686F80,
        filled: true,
        fillColor: AppColors.steelWhiteF6F6F6,
        hintText: hintText.tr(),
        hintStyle: AppFonts.poppinsRegular12.copyWith(
          color: AppColors.dimGrey6C6C6C,
        ),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }
}

InputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide(width: .9, color: AppColors.lightGreyD9D9D9),
  );
}
