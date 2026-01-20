import 'package:animooo/core/services/pick_image.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/utils/app_translate.dart';
import 'package:animooo/core/validators/email_validator.dart';
import 'package:animooo/core/validators/empty_fileds_validator.dart';
import 'package:animooo/core/validators/empty_img_validator.dart';
import 'package:animooo/core/validators/phone_validator.dart';
import 'package:animooo/feature/auth/domain/entities/signup_entity.dart';
import 'package:animooo/feature/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:animooo/core/widgets/custom_button.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:animooo/feature/auth/presentation/widgets/filed_name.dart';
import 'package:animooo/feature/auth/presentation/widgets/logo_and_name.dart';
import 'package:animooo/feature/auth/presentation/widgets/password_and_confirm_password.dart';
import 'package:animooo/feature/auth/presentation/widgets/signup_footer.dart';
import 'package:animooo/feature/auth/presentation/widgets/upload_profile_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key, required this.state});
  final AuthState state;

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();

    if (kDebugMode) {
      _firstNameController.text = "John";
      _lastNameController.text = "Doe";
      _emailController.text = "hazm05771@gmail.com";
      _phoneController.text = "01023217166";
      _passwordController.text = "Password123#";
      _confirmPasswordController.text = "Password123#";
    }
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
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
            autovalidateMode: _autoValidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LogoAndName(authType: AppTranslate.kSignUp.tr()),
                FieldName(filedName: AppStrings.kFirstName.tr()),
                SizedBox(height: AppSpacing.h6),
                CustomFormTextField(
                  controller: _firstNameController,
                  validator: (value) => EmptyFieldsValidator.call(value),

                  hintText: AppStrings.kEnterYourFirstName.tr(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: AppSpacing.h16),
                FieldName(filedName: AppStrings.kLastName.tr()),
                SizedBox(height: AppSpacing.h6),
                CustomFormTextField(
                  controller: _lastNameController,
                  validator: (value) => EmptyFieldsValidator.call(value),
                  hintText: AppStrings.kEnterYourLastName.tr(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: AppSpacing.h16),
                FieldName(filedName: AppStrings.kEmail.tr()),
                SizedBox(height: AppSpacing.h6),
                CustomFormTextField(
                  controller: _emailController,
                  validator: (value) => EmailValidator.call(value),
                  hintText: AppStrings.kEnterYourEmailAddress.tr(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: AppSpacing.h16),
                FieldName(filedName: AppStrings.kPhone.tr()),
                SizedBox(height: AppSpacing.h6),
                CustomFormTextField(
                  controller: _phoneController,
                  validator: (value) => PhoneValidator.call(value),
                  hintText: AppStrings.kEnterYourPhone.tr(),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: AppSpacing.h16),
                PasswordAndConfirmPassword(
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
                SizedBox(height: AppSpacing.h16),
                UploadProfileImage(
                  validator: (value) => EmptyImgValidator.call(value),
                ),
                SizedBox(height: AppSpacing.h28),
                widget.state is SignUpAuthLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        text: AppStrings.kSignup.tr(),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().userSignUp(
                              userEntity: SignupEntity(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailController.text,
                                phone: _phoneController.text,
                                image: ImagePickerClass.fileImage!.path,
                              ),
                              password: _passwordController.text,
                            );
                          } else {
                            _autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                SizedBox(height: AppSpacing.h8),
                const SignUpFooter(),
                SizedBox(height: AppSpacing.h20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
