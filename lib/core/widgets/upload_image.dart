import 'dart:io';

import 'package:animooo/core/services/pick_image.dart';
import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_images.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/widgets/filed_name.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UploadImage extends FormField<File?> {
  UploadImage({super.key, super.validator, required String filedName})

    : super(
        builder: (FormFieldState<File?> state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldName(filedName: filedName),
              SizedBox(height: AppSpacing.h8),
              DottedBorder(
                options: RectDottedBorderOptions(
                  dashPattern: [4, 4],
                  color: state.hasError
                      ? AppColors.redFC1C1A
                      : AppColors.primary04332D,
                  strokeWidth: 1,
                ),
                child: Container(
                  width: double.infinity,
                  height: AppSpacing.h200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      final File? file = await ImagePickerClass.imagePicker();
                      if (file != null) {
                        state.didChange(file);
                      }
                    },
                    child: state.value == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Assets.imagesSelectimageSvg),
                              SizedBox(height: AppSpacing.h16),
                              Text(
                                AppStrings.kSelectFile.tr(),
                                style: AppFonts.urbanistMedium16.copyWith(
                                  color: AppColors.primary04332D,
                                ),
                              ),
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.file(
                              state.value!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                  ),
                ),
              ),
              if (state.hasError) ...[
                SizedBox(height: AppSpacing.h4),
                Text(
                  state.errorText!,
                  style: AppFonts.urbanistRegular12.copyWith(
                    color: AppColors.redFC1C1A,
                  ),
                ),
              ],
            ],
          );
        },
      );
}
