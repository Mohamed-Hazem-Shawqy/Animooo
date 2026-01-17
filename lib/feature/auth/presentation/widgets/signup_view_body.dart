import 'dart:developer';

import 'package:animooo/core/utils/app_consts.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/utils/app_translate.dart';
import 'package:animooo/core/validators/empty_fileds_validator.dart';
import 'package:animooo/core/validators/empty_img_validator.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_button.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:animooo/feature/auth/presentation/widgets/filed_name.dart';
import 'package:animooo/feature/auth/presentation/widgets/logo_and_name.dart';
import 'package:animooo/feature/auth/presentation/widgets/password_and_confirm_password.dart';
import 'package:animooo/feature/auth/presentation/widgets/signup_footer.dart';
import 'package:animooo/feature/auth/presentation/widgets/upload_profile_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.pw10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LogoAndName(authType: AppTranslate.kSignUp.tr()),
                FieldName(filedName: AppStrings.kFirstName.tr()),
                SizedBox(height: 6.h),
                CustomFormTextField(
                  validator: (value) => EmptyFieldsValidator.call(value),

                  hintText: AppStrings.kEnterYourFirstName.tr(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 16.h),
                FieldName(filedName: AppStrings.kLastName.tr()),
                SizedBox(height: 6.h),
                CustomFormTextField(
                  validator: (value) => EmptyFieldsValidator.call(value),
                  hintText: AppStrings.kEnterYourLastName.tr(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 16.h),
                FieldName(filedName: AppStrings.kEmail.tr()),
                SizedBox(height: 6.h),
                CustomFormTextField(
                  validator: (value) => EmptyFieldsValidator.call(value),
                  hintText: AppStrings.kEnterYourEmailAddress.tr(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.h),
                FieldName(filedName: AppStrings.kPhone.tr()),
                SizedBox(height: 6.h),
                CustomFormTextField(
                  validator: (value) => EmptyFieldsValidator.call(value),
                  hintText: AppStrings.kEnterYourPhone.tr(),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16.h),
                PasswordAndConfirmPassword(
                  passwordController: TextEditingController(),
                  confirmPasswordController: TextEditingController(),
                ),
                SizedBox(height: 16.h),
                UploadProfileImage(
                  validator: (value) => EmptyImgValidator.call(value),
                ),
                SizedBox(height: 28.h),
                CustomButton(
                  text: AppStrings.kSignup.tr(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      log('vaidated');
                    }
                  },
                ),
                SizedBox(height: 8.h),
                const SignUpFooter(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
