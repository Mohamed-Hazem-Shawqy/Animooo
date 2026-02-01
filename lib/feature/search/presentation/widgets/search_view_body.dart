import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/search/presentation/widgets/select_aniaml_orcategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.w18),
      child: Column(
        children: [
          SizedBox(height: AppSpacing.h14),
          TextField(
            cursorColor: AppColors.primary04332D,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.primary04332D),
              ),
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: AppSpacing.h8),
          const SelectAnimalorCategory(),
        ],
      ),
    );
  }
}
