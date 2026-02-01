
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:easy_localization/easy_localization.dart';

class PublicValidator {
  static String? call(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.kThisFieldRequired.tr();
    }
    return null;
  }}