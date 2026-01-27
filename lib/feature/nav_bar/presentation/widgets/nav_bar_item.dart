import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/nav_bar/domain/entities/nav_bar_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItems extends StatelessWidget {
  final NavBarEntity bottomNavBarEntity;
  final bool isSelected;

  const NavBarItems({
    super.key,
    required this.bottomNavBarEntity,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          bottomNavBarEntity.inActiveIcon,
          colorFilter: isSelected
              ? ColorFilter.mode(AppColors.primary04332D, BlendMode.srcIn)
              : ColorFilter.mode(AppColors.mediumGrey737373, BlendMode.srcIn),
        ),
        SizedBox(height: AppSpacing.h4),
        Text(
          bottomNavBarEntity.title.tr(),
          style: TextStyle(
            color: isSelected
                ? AppColors.primary04332D
                : AppColors.mediumGrey737373,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
