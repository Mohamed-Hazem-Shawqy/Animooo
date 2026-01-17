import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_button.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_password_filed.dart';
import 'package:animooo/feature/auth/presentation/widgets/dont_have_account.dart';
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
              const LogoAndName(authType: 'login'),
              SizedBox(height: 45.h),
              const FieldName(filedName: 'Email'),
              SizedBox(height: 6.h),

              CustomFormTextField(
                hintText: 'enterYourEmailAddress'.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              const FieldName(filedName: "Password"),
              SizedBox(height: 6.h),

              CustomPasswordField(),

              const ForgetPassword(),
              SizedBox(height: 31.h),
              CustomButton(text: 'login'.tr(), onPressed: () {}),
              SizedBox(height: MediaQuery.sizeOf(context).height * .265),
              Center(
                child: HaveOrDontHaveAccount(
                  authType: "signupnow",
                  haveorNotHaveAccount: 'Donthaveanaccount',
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.signUpRoute);
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
