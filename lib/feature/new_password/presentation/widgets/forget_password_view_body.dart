import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/widgets/custom_button.dart';
import 'package:animooo/core/widgets/otp_verifiay_name_and_hint_text.dart';
import 'package:animooo/core/widgets/custom_form_text_field.dart';
import 'package:animooo/core/widgets/filed_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.w18),
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
          ),
          SizedBox(height: AppSpacing.h151),

          CustomButton(text: AppStrings.kSendCode.tr(), onPressed: () {}),
        ],
      ),
    );
  }
}
