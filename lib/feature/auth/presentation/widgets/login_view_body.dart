import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: SvgPicture.asset(Assets.imagesLogoSvg)),
          Center(child: Text('ANIMOOO', style: AppFonts.originalSurfer11)),
        ],
      ),
    );
  }
}
