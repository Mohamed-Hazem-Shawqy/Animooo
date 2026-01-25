import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/validators/email_validator.dart';
import 'package:animooo/core/widgets/custom_button.dart';
import 'package:animooo/core/widgets/custom_loading_indecator.dart';
import 'package:animooo/core/widgets/otp_verifiay_name_and_hint_text.dart';
import 'package:animooo/core/widgets/custom_form_text_field.dart';
import 'package:animooo/core/widgets/filed_name.dart';
import 'package:animooo/feature/new_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key, required this.state});
  final ForgetPasswordState state;

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late TextEditingController emailController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.w18),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: AppSpacing.h17),

              OtpVerifiayNameAndHintText(
                headlinetext: AppStrings.kForgetYourPassword.tr(),
                text: AppStrings.kPleaseEnterYourEmail.tr(),
              ),
              SizedBox(height: AppSpacing.h58),

              FieldName(filedName: AppStrings.kEmail.tr()),
              SizedBox(height: AppSpacing.h6),

              CustomFormTextField(
                hintText: AppStrings.kEnterYourEmail.tr(),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) => EmailValidator.call(value),
              ),
              SizedBox(height: AppSpacing.h151),

              widget.state is ForgetPasswordLoading
                  ? CustomLoadingIndecator()
                  : CustomButton(
                      text: AppStrings.kSendCode.tr(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ForgetPasswordCubit>().forgetPassword(
                            emailController.text.trim(),
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
