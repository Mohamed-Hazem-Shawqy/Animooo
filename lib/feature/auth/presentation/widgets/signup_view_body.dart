import 'package:animooo/feature/auth/presentation/widgets/custom_button.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_password_filed.dart';
import 'package:animooo/feature/auth/presentation/widgets/filed_name.dart';
import 'package:animooo/feature/auth/presentation/widgets/logo_and_name.dart';
import 'package:animooo/feature/auth/presentation/widgets/signup_footer.dart';
import 'package:animooo/feature/auth/presentation/widgets/upload_profile_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoAndName(authType: 'signup'),

              const FieldName(filedName: 'firstname'),
              SizedBox(height: 6.h),
              CustomFormTextField(
                hintText: 'enterYourFirstName'.tr(),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16.h),
              const FieldName(filedName: 'lastname'),
              SizedBox(height: 6.h),
              CustomFormTextField(
                hintText: 'enterYourLastName'.tr(),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16.h),
              const FieldName(filedName: 'Email'),
              SizedBox(height: 6.h),
              CustomFormTextField(
                hintText: 'enterYourEmailAddress'.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              const FieldName(filedName: 'phone'),
              SizedBox(height: 6.h),
              CustomFormTextField(
                hintText: 'enterYourPhone'.tr(),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.h),
              const FieldName(filedName: 'Password'),
              SizedBox(height: 6.h),
              CustomPasswordField(),
              SizedBox(height: 16.h),
              const FieldName(filedName: 'confirmpassword'),
              SizedBox(height: 6.h),
              CustomPasswordField(),
              SizedBox(height: 16.h),
              const UploadProfileImage(),
              SizedBox(height: 28.h),
              CustomButton(text: 'signup'.tr(), onPressed: () {}),
              SizedBox(height: 8.h),
              const SignUpFooter(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
