import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/category/domain/entities/get_all_category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.category});
  final GetAllCategoryEntity category;
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
                          backgroundImage: NetworkImage(category.image),
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
                      category.name,
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
