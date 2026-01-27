import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/nav_bar/domain/entities/nav_bar_entity.dart';
import 'package:animooo/feature/nav_bar/presentation/widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';

class NavBarViewBody extends StatelessWidget {
  const NavBarViewBody({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });
  final int activeIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: AppSpacing.h8,
        left: AppSpacing.w16,
        right: AppSpacing.w16,
        bottom: AppSpacing.h12,
      ),
      decoration: ShapeDecoration(
        color: AppColors.colorF9F9F9,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.colorEDEDED),
        ),
      ),
      child: Row(
        children: NavBarEntity.navBarItems().asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),

              child: NavBarItems(
                bottomNavBarEntity: entity,
                isSelected: activeIndex == index,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
