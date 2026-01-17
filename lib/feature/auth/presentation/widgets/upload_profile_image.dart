import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:animooo/feature/auth/presentation/widgets/filed_name.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UploadProfileImage extends StatelessWidget {
  const UploadProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FieldName(filedName: 'uploadimageforyourprofile'),
        SizedBox(height: 8.h),
        DottedBorder(
          options: RectDottedBorderOptions(
            dashPattern: [4, 4],
            color: AppColors.primary04332D,
            strokeWidth: 1,
          ),
          child: Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.imagesSelectimageSvg),
                SizedBox(height: 16.h),
                Text(
                  "selectfile".tr(),
                  style: AppFonts.urbanistMedium16.copyWith(
                    color: AppColors.primary04332D,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}