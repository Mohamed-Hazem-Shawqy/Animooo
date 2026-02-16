import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget? appBarFunc(BuildContext context, String text,{bool canPop=true}) {
  return AppBar(
    automaticallyImplyLeading: false,

    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: canPop ?() {
            AppNavigation.pop(context);
          }:null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Icon(
              Icons.arrow_back_ios,
              weight: 10,
              size: 25.sp,
              color: AppColors.primary04332D,
            ),
          ),
        ),
        const SizedBox(width: 2),
        Text(
          text,
          style: AppFonts.otamaRegular20.copyWith(
            color: AppColors.primary04332D,
          ),
        ),
      ],
    ),
  );
}
