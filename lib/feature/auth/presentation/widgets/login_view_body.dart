import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_button.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_password_filed.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: SvgPicture.asset(Assets.imagesLogoSvg)),
              Center(child: Text('ANIMOOO', style: AppFonts.originalSurfer11)),
              SizedBox(height: 30.h),
              Center(child: Text('login'.tr(), style: AppFonts.otama38)),
              SizedBox(height: 45.h),
              Text(
                'Email'.tr(),
                style: AppFonts.poppinsRegular16.copyWith(
                  color: AppColors.color505050,
                ),
              ),
              SizedBox(height: 6.h),

              CustomFormTextField(
                hintText: 'enterYourEmailAddress'.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              Text(
                'Password'.tr(),
                style: AppFonts.poppinsRegular16.copyWith(
                  color: AppColors.color505050,
                ),
              ),
              SizedBox(height: 6.h),

              CustomPasswordField(),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'ForgetPassword'.tr(),
                      style: AppFonts.poppinsMedium10.copyWith(
                        color: AppColors.primary04332D,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 31.h),
              CustomButton(text: 'login'.tr(), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
