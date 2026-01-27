import 'dart:developer';

import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/widgets/custom_button.dart';
import 'package:animooo/core/widgets/password_and_confirm_password.dart';
import 'package:animooo/feature/new_password/presentation/manager/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewPasswordViewBody extends StatefulWidget {
  const CreateNewPasswordViewBody({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<CreateNewPasswordViewBody> createState() =>
      _CreateNewPasswordViewBodyState();
}

class _CreateNewPasswordViewBodyState extends State<CreateNewPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.w18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.h17),
              Text(
                AppStrings.kCreateNewPassword,
                style: AppFonts.otamaRegular20.copyWith(
                  color: AppColors.primary04332D,
                ),
              ),
              SizedBox(height: AppSpacing.h10),

              SizedBox(height: AppSpacing.h20),
              PasswordAndConfirmPassword(
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                filedName: AppStrings.kNewPassword.tr(),
              ),
              SizedBox(height: AppSpacing.h82),

             CustomButton(
                      text: AppStrings.kSubmit,
                      onPressed: () {
                        log(widget.email);
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<CreateNewPasswordCubit>()
                              .createNewPassword(
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                email: widget.email,
                              );
                          log(widget.email);
                        }
                        log(widget.email);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
