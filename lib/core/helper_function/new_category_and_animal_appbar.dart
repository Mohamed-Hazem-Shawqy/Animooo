import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? newCategoryAndAnimalAppBar(String title) {
 return AppBar(
    title: Text(
      title,
      style: AppFonts.otamaRegular20.copyWith(color: AppColors.primary04332D),
    ),
  );
  
}
