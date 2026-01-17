import 'package:animooo/core/app_navigation.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/core/validators/email_validator.dart';
import 'package:animooo/core/validators/password_validator.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_button.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_password_filed.dart';
import 'package:animooo/feature/auth/presentation/widgets/have_dont_have_account.dart';
import 'package:animooo/feature/auth/presentation/widgets/filed_name.dart';
import 'package:animooo/feature/auth/presentation/widgets/forget_password.dart';
import 'package:animooo/feature/auth/presentation/widgets/logo_and_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.w18),
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LogoAndName(authType: AppStrings.kLogin.tr()),
                SizedBox(height: AppSpacing.h45),
                FieldName(filedName: AppStrings.kEmail.tr()),
                SizedBox(height: AppSpacing.h6),

                CustomFormTextField(
                  hintText: AppStrings.kEnterYourEmailAddress.tr(),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => EmailValidator.call(value),
                ),
                SizedBox(height: AppSpacing.h16),
                FieldName(filedName: AppStrings.kPassword.tr()),
                SizedBox(height: AppSpacing.h6),

                CustomPasswordField(
                  validator: (value) => PasswordValidator.call(value),
                ),

                const ForgetPassword(),
                SizedBox(height: AppSpacing.h30),
                CustomButton(
                  text: AppStrings.kLogin.tr(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Proceed with login
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .265),
                Center(
                  child: HaveOrDontHaveAccount(
                    authType: AppStrings.kSignupNow.tr(),
                    haveorNotHaveAccount: AppStrings.kDontHaveAnAccount.tr(),
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
      ),
    );
  }
}
