import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/widgets/name_and_puplic.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAnimalorCategory extends StatelessWidget {
  const SelectAnimalorCategory({
    super.key,
    required this.isSelected,
    required this.onSelected,
  });

  final SelectionType isSelected;
final ValueChanged<SelectionType> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onSelected(SelectionType.category),
          child: InfoSmallContainer(
            isSelected: SelectionType.category == isSelected,
            text: AppStrings.kCategory.tr(),
            width: 65.w,
            height: 22.h,
          ),
        ),
        SizedBox(width: AppSpacing.w12),

        GestureDetector(
          onTap: () => onSelected(SelectionType.animal),
          child: InfoSmallContainer(
            isSelected: SelectionType.animal == isSelected,
            text: AppStrings.kAnimal.tr(),
            width: 54.w,
            height: 22.h,
          ),
        ),
      ],
    );
  }
}

enum SelectionType { animal, category }
