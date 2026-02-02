import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AniamlsContainer extends StatelessWidget {
  const AniamlsContainer({super.key, required this.animal});
final GetAllAnimalEntity animal;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: EdgeInsets.symmetric(horizontal: AppSpacing.w16),
      decoration: BoxDecoration(
        color: AppColors.steelWhiteF6F6F6,

        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppSpacing.w8),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animal.name,
                      style: AppFonts.urbanistSemiBold12.copyWith(
                        color: AppColors.black000000,
                      ),
                    ),
                    SizedBox(height: AppSpacing.h4),
                    Text(
                      'create by Ahmed El-said',
                      style: AppFonts.urbanistRegular12.copyWith(
                        color: AppColors.greyish999999,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '${animal.price}\$',
                  style: AppFonts.urbanistSemiBold12.copyWith(
                    color: AppColors.primary04332D,
                  ),
                ),

                Icon(Icons.more_vert),
              ],
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Image.network(animal.image, fit: BoxFit.cover),
          ),

          /// Description
          Padding(
            padding: EdgeInsets.all(AppSpacing.w10),
            child: Text(
              animal.description,
              style: AppFonts.urbanistRegular12.copyWith(
                color: AppColors.black000000,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
