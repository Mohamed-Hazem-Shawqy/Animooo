import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:flutter/material.dart';

class CategoryAndAddnewCategory extends StatelessWidget {
  const CategoryAndAddnewCategory({
    super.key,
    required this.text,
    required this.bigText,
    required this.length,
  });
  final String text;
  final String bigText;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.w23),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$bigText ($length)',
            style: AppFonts.poppinsMedium16.copyWith(
              color: AppColors.black000000,
            ),
          ),
          Text(
            text,
            style: AppFonts.otamaRegular12.copyWith(
              color: AppColors.black000000,
            ),
          ),
        ],
      ),
    );
  }
}
