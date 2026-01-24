import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ScaffoldFeatureController snackBarErrorFunction(
  BuildContext context,
  String content,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 60.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
    ),
  );
}

ScaffoldFeatureController snackBarSuccessFunction(
  BuildContext context,
  String content,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: Colors.green,

      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 60.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
    ),
  );
}
