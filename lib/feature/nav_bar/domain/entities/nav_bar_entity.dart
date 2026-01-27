import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_images.dart';


class NavBarEntity {
  final String title;
  final String activeIcon;
  final String inActiveIcon;

  NavBarEntity({
    required this.activeIcon,
    required this.inActiveIcon,
    required this.title,
  });

  static List<NavBarEntity> navBarItems() {
    return [
      NavBarEntity(
        activeIcon: Assets.imagesHomeIconSvg,
        inActiveIcon: Assets.imagesHomeIconSvg,
        title: AppStrings.kHome,
      ),
      NavBarEntity(
        activeIcon: Assets.imagesSearchIconSvg,
        inActiveIcon: Assets.imagesSearchIconSvg,
        title: AppStrings.kSearch,
      ),
      NavBarEntity(
        activeIcon: Assets.imagesCategoryItemSvg,
        inActiveIcon: Assets.imagesCategoryItemSvg,
        title: AppStrings.kCategory,
      ),
      NavBarEntity(
        activeIcon: Assets.imagesFavoriteIconSvg,
        inActiveIcon: Assets.imagesFavoriteIconSvg,
        title: AppStrings.kAnimal,
      ),
      NavBarEntity(
        activeIcon: Assets.imagesProfileIconSvg,
        inActiveIcon: Assets.imagesProfileIconSvg,
        title: AppStrings.kMe,
      ),
    ];
  }
}
