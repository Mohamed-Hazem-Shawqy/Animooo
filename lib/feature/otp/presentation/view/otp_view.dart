import 'package:animooo/core/helper_function/appbar_func.dart';
import 'package:animooo/feature/otp/presentation/widgets/otp_view_body.dart';
import 'package:flutter/material.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBarFunc(context), body: const OtpViewBody());
  }
}
