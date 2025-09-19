import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.softGrey, thickness: 2)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Text("OR", style: AppStyles.font16W700Grey),
        ),
        Expanded(child: Divider(color: AppColors.softGrey, thickness: 2)),
      ],
    );
  }
}
