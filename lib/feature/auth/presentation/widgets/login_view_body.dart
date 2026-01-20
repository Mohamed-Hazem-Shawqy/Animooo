import 'package:animooo/core/utils/app_navigation.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/core/validators/email_validator.dart';
import 'package:animooo/core/validators/password_validator.dart';
import 'package:animooo/feature/auth/domain/entities/signin_entity.dart';
import 'package:animooo/feature/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:animooo/core/widgets/custom_button.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_password_filed.dart';
import 'package:animooo/feature/auth/presentation/widgets/have_dont_have_account.dart';
import 'package:animooo/feature/auth/presentation/widgets/filed_name.dart';
import 'package:animooo/feature/auth/presentation/widgets/forget_password.dart';
import 'package:animooo/feature/auth/presentation/widgets/logo_and_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key, required this.state});
  final AuthState state;

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                  controller: _emailController,
                  hintText: AppStrings.kEnterYourEmailAddress.tr(),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => EmailValidator.call(value),
                ),
                SizedBox(height: AppSpacing.h16),
                FieldName(filedName: AppStrings.kPassword.tr()),
                SizedBox(height: AppSpacing.h6),

                CustomPasswordField(
                  passwordController: _passwordController,
                  validator: (value) => PasswordValidator.call(value),
                ),

                const ForgetPassword(),
                SizedBox(height: AppSpacing.h30),
                widget.state is SignInAuthLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        text: AppStrings.kLogin.tr(),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().userSignIn(
                              userEntity: SigninEntity(
                                email: _emailController.text,
                              ),
                              password: _passwordController.text,
                            );
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
