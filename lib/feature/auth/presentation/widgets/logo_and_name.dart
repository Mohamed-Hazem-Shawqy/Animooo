import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoAndName extends StatelessWidget {
  const LogoAndName({
    super.key, required this.authType,
  });
 final String authType;

  @override
  Widget build(BuildContext context) {
    return Column(children: [ Center(child: SvgPicture.asset(Assets.imagesLogoSvg)),
     Center(child: Text('ANIMOOO', style: AppFonts.originalSurfer11)),
     SizedBox(height: 30.h),
     Center(child: Text(authType.tr(), style: AppFonts.otama38)),],);
  }
}