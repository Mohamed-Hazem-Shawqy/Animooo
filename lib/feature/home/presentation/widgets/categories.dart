import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.h100,
      child: Padding(
        padding: EdgeInsets.only(left: AppSpacing.w31),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 31.r,
                          child: Image.asset(
                            Assets.imagesCatpng,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: AppColors.primary04332D,
                            radius: 10.r,
                            child: FittedBox(
                              child: Text(
                                '10',
                                style: AppFonts.urbanistMedium12.copyWith(
                                  color: AppColors.whiteFFFFFF,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Cats',
                      style: AppFonts.urbanistMedium16.copyWith(
                        color: AppColors.black000000,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
