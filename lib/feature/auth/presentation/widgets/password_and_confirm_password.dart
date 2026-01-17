import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_consts.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/validators/confirem_password_validator.dart';
import 'package:animooo/core/validators/password_not_valid_validator.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_password_filed.dart';
import 'package:animooo/feature/auth/presentation/widgets/filed_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordAndConfirmPassword extends StatelessWidget {
  const PasswordAndConfirmPassword({super.key, required this.passwordController, required this.confirmPasswordController});
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldName(filedName: AppStrings.kPassword.tr()),
        SizedBox(height: 6.h),
        CustomPasswordField(
          passwordController: passwordController ,
          validator: (value) => PasswordNotValidValidator.call(value),
        ),
        SizedBox(height: 34.h),
        const PasswordRules(),

        SizedBox(height: 16.h),
        FieldName(filedName: AppStrings.kConfirmPassword.tr()),
        SizedBox(height: 6.h),
        CustomPasswordField(
          passwordController: confirmPasswordController ,
          validator: (value) =>
              ConfiremPasswordValidator.call(
                null,
                value,
              ),
        ),
      ],
    );
  }
}

class PasswordRules extends StatelessWidget {
  const PasswordRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RuleItem(textKey: AppStrings.kPasswordMinLength.tr()),
        SizedBox(height: 5.h),
        _RuleItem(textKey: AppStrings.kPasswordUppercase.tr()),
        SizedBox(height: 5.h),
        _RuleItem(textKey: AppStrings.kPasswordLowercase.tr()),
        SizedBox(height: 5.h),
        _RuleItem(textKey: AppStrings.kPasswordSpecial.tr()),
        SizedBox(height: 5.h),
        _RuleItem(textKey: AppStrings.kPasswordNumber.tr()),
      ],
    );
  }
}

class _RuleItem extends StatelessWidget {
  final String textKey;

  const _RuleItem({required this.textKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: 5.w, color: AppColors.brightGreen08A33B),
          SizedBox(width: 2.w),
          Expanded(
            child: Text(
              textKey,
              style: AppFonts.poppinsSemiBold9.copyWith(
                color: AppColors.brightGreen08A33B,
                decoration: TextDecoration.lineThrough,
                decorationColor: AppColors.brightGreen08A33B,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
