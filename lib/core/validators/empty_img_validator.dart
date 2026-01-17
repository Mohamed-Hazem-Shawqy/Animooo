import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

class EmptyImgValidator {
  static String? call(File? value) {
    if (value == null || value.path.isEmpty) {
      return 'pleaseuploadyourprofileimage'.tr();
    }
    return null;
  }
}
