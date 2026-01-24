import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/validators/confirem_password_validator.dart';
import 'package:animooo/core/validators/password_validator.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_password_filed.dart';
import 'package:animooo/core/widgets/filed_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PasswordAndConfirmPassword extends StatelessWidget {
  const PasswordAndConfirmPassword({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController, required this.filedName,
  });
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String filedName ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldName(filedName: filedName),
        SizedBox(height: AppSpacing.h6),
        CustomPasswordField(
          passwordController: passwordController,
          validator: (value) => PasswordValidator.call(value),
        ),
        SizedBox(height: AppSpacing.h34),
        PasswordRules(passwordController: passwordController),

        SizedBox(height: AppSpacing.h16),
        FieldName(filedName: AppStrings.kConfirmPassword.tr()),
        SizedBox(height: AppSpacing.h6),
        CustomPasswordField(
          passwordController: confirmPasswordController,
          validator: (value) =>
              ConfiremPasswordValidator.call(passwordController.text, value),
        ),
      ],
    );
  }
}

class PasswordRules extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordRules({super.key, required this.passwordController});

  @override
  State<PasswordRules> createState() => _PasswordRulesState();
}

class _PasswordRulesState extends State<PasswordRules> {
  bool hasMinLength = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;

  @override
  void initState() {
    super.initState();
    widget.passwordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    final password = widget.passwordController.text;

    setState(() {
      hasMinLength = password.length >= 6;
      hasUppercase = password.contains(RegExp(r'[A-Z]'));
      hasLowercase = password.contains(RegExp(r'[a-z]'));
      hasNumber = password.contains(RegExp(r'\d'));
      hasSpecialChar = password.contains(
        RegExp(r'[^A-Za-z\d]'),
      ); // any special char
    });
  }

  @override
  void dispose() {
    widget.passwordController.removeListener(_validatePassword);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RuleItem(
          textKey: AppStrings.kPasswordMinLength.tr(),
          isValid: hasMinLength,
        ),
        _RuleItem(
          textKey: AppStrings.kPasswordUppercase.tr(),
          isValid: hasUppercase,
        ),
        _RuleItem(
          textKey: AppStrings.kPasswordLowercase.tr(),
          isValid: hasLowercase,
        ),
        _RuleItem(textKey: AppStrings.kPasswordNumber.tr(), isValid: hasNumber),
        _RuleItem(
          textKey: AppStrings.kPasswordSpecial.tr(),
          isValid: hasSpecialChar,
        ),
      ],
    );
  }
}

class _RuleItem extends StatelessWidget {
  final String textKey;
  final bool isValid;

  const _RuleItem({required this.textKey, this.isValid = false});

  @override
  Widget build(BuildContext context) {
    final color = isValid ? AppColors.brightGreen08A33B : AppColors.redFC1C1A;

    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.h4),
      child: Row(
        children: [
          Icon(Icons.circle, size: AppSpacing.h4, color: color),
          SizedBox(width: AppSpacing.w2),
          Expanded(
            child: Text(
              textKey,
              style: AppFonts.poppinsSemiBold9.copyWith(
                color: color,
                decoration: isValid
                    ? TextDecoration.lineThrough
                    : TextDecoration.lineThrough,
                decorationColor: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
