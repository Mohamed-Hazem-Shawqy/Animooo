import 'package:animooo/core/app_navigation.dart';
import 'package:animooo/core/utils/app_consts.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_button.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_password_filed.dart';
import 'package:animooo/feature/auth/presentation/widgets/have_dont_have_account.dart';
import 'package:animooo/feature/auth/presentation/widgets/filed_name.dart';
import 'package:animooo/feature/auth/presentation/widgets/forget_password.dart';
import 'package:animooo/feature/auth/presentation/widgets/logo_and_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
               LogoAndName(authType: AppStrings.kLogin.tr()),
              SizedBox(height: 45.h),
               FieldName(filedName: AppStrings.kEmail.tr()),
              SizedBox(height: 6.h),

              CustomFormTextField(
                hintText: AppStrings.kEnterYourEmailAddress.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              FieldName(filedName: AppStrings.kPassword.tr()),
              SizedBox(height: 6.h),

              CustomPasswordField(),

              const ForgetPassword(),
              SizedBox(height: 31.h),
              CustomButton(text: AppStrings.kLogin.tr(), onPressed: () {}),
              SizedBox(height: MediaQuery.sizeOf(context).height * .265),
              Center(
                child: HaveOrDontHaveAccount(
                  authType: AppStrings.kSignupNow,
                  haveorNotHaveAccount: AppStrings.kDontHaveAnAccount,
                  onTap: () {
                    AppNavigation.pushNamedAndRemoveUntil(
                      context,
                      RouteName.signUpRoute,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
