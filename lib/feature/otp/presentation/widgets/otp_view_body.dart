import 'dart:developer';

import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/widgets/custom_button.dart';
import 'package:animooo/core/widgets/custom_snackbar.dart';
import 'package:animooo/feature/otp/presentation/manager/counter_cubit/counter_cubit.dart';
import 'package:animooo/feature/otp/domain/entities/otp_entity.dart';
import 'package:animooo/feature/otp/presentation/manager/otp_verification_cubit/otp_verification_cubit.dart';
import 'package:animooo/feature/otp/presentation/manager/send_new_otp_cubit/send_new_otp_cubit.dart';
import 'package:animooo/feature/otp/presentation/widgets/otp_fileds.dart';
import 'package:animooo/core/widgets/otp_verifiay_name_and_hint_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key, this.email = 'hazm05771@gmail.com'});
  final String? email;

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  late final TextEditingController _otpController;

  @override
  void initState() {
    _otpController = TextEditingController();
    context.read<CounterCubit>().startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('rebuild otp');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.h16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSpacing.h17),
          OtpVerifiayNameAndHintText(
            headlinetext: AppStrings.kOtpVerification.tr(),
            text: AppStrings.kPleaseCheckYourEmailForOTP.tr(),
          ),
          SizedBox(height: AppSpacing.h54),
          OtpFileds(otpController: _otpController),
          SizedBox(height: AppSpacing.h41),
          CustomButton(
            text: AppStrings.kConfirm.tr(),
            onPressed: () {
              context.read<OtpVerificationCubit>().verifyOtp(
                _otpController.text,
                OtpEntity(email: widget.email ?? 'hazm05771@gmail.com'),
              );
            },
          ),
          SizedBox(height: AppSpacing.h6),
          BlocConsumer<SendNewOtpCubit, SendNewOtpState>(
            listener: (context, state) {
              if (state is SendNewOtpSuccess) {
                snackBarSuccessFunction(
                  context,
                  'we send new Verfication code into your email',
                );
              } else if (state is SendNewOtpFailuer) {
                snackBarErrorFunction(
                  context,
                  'error in send new Verfication code please try again!',
                );
              }
            },
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  final counterCubit = context.read<CounterCubit>();
                  if (counterCubit.initTimer == 0) {
                    context.read<SendNewOtpCubit>().sendNewOtpCode(
                      OtpEntity(email: widget.email ?? 'hazm05771@gmail.com'),
                    );
                    counterCubit.initTimer = 59;
                    counterCubit.startTimer();
                  }
                },
                child: Center(
                  child: BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      int time = 0;
                      if (state is CounterDecrease) {
                        time = state.time;
                      }
                      return Text(
                        "${AppStrings.kResendCode.tr()}00:$time",
                        style: AppFonts.interRegular12.copyWith(
                          color: AppColors.color180901,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
