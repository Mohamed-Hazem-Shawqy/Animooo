import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/feature/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NameAndPuplic extends StatelessWidget {
  const NameAndPuplic({
    super.key,
    required this.text,
    this.radius = 14,
    this.width = 48,
    this.height = 22,
    required this.style,
  });

  final String text;
  final double radius;
  final double width;
  final double height;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: radius.r,
          backgroundImage: AssetImage(Assets.imagesDogPng),
        ),
        SizedBox(width: AppSpacing.w6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is SignInAuthSuccess) {
                  final userName = state.signinEntity.firstName;
                  return Text('$userName', style: style);
                }
                return const SizedBox();
              },
            ),
            SizedBox(height: AppSpacing.w4),
            InfoSmallContainer(width: width, height: height, text: text),
          ],
        ),
      ],
    );
  }
}

class InfoSmallContainer extends StatelessWidget {
  const InfoSmallContainer({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    this.isSelected,
  });

  final double width;
  final double height;
  final String text;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: isSelected == true
            ? AppColors.darkTeal05332E
            : AppColors.color16A99F.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.imagesPublicIconSvg,
            colorFilter: isSelected == true
                ? ColorFilter.mode(AppColors.whiteFFFFFF, BlendMode.srcIn)
                : null,
          ),
          SizedBox(width: AppSpacing.w4),
          Text(
            text,
            style: AppFonts.urbanistSemiBold10.copyWith(
              color: isSelected == true
                  ? AppColors.whiteFFFFFF
                  : AppColors.brightGreen08A33B,
            ),
          ),
        ],
      ),
    );
  }
}
