import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoAndName extends StatelessWidget {
  const LogoAndName({super.key, required this.authType});
  final String authType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: AppSpacing.h4)),
        Center(child: SvgPicture.asset(Assets.imagesLogoSvg)),
        Center(
          child: Text(AppStrings.kAppName, style: AppFonts.originalSurfer11),
        ),
        SizedBox(height: AppSpacing.h30),
        Center(child: Text(authType, style: AppFonts.otama38)),
      ],
    );
  }
}
