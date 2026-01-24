import 'package:animooo/core/helper_function/appbar_func.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/feature/new_password/presentation/widgets/forget_password_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:appBarFunc(context,AppStrings.kBack.tr()),
      body: ForgetPasswordViewBody(),
    );
  }
}