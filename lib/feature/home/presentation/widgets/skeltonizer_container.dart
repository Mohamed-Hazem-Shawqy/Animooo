import 'package:animooo/core/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkeltonizerContainer extends StatelessWidget {
  const SkeltonizerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.w16),
      height: 220,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
class SkeltonizerCircleAvatar extends StatelessWidget {
  const SkeltonizerCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
    radius: 31.r,
    backgroundColor:  Colors.grey.shade300,
    );
  }
}