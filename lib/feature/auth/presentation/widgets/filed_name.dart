import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:flutter/material.dart';

class FieldName extends StatelessWidget {
  const FieldName({
    super.key, required this.filedName,
  });
final String filedName;
  @override
  Widget build(BuildContext context) {
    return Text(
      filedName,
      style: AppFonts.poppinsRegular16.copyWith(
        color: AppColors.color505050,
      ),
    );
  }
}