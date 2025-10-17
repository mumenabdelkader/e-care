import 'package:clinic/core/constants/app_assets.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUpGoogle extends StatelessWidget {
  const CustomSignUpGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final borderColor = Theme.of(context).dividerColor;

    return GestureDetector(
      child: Container(
        height: 48.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: borderColor),
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.googleLogo),
            const HorizontalSpacing(15),

            Text("Sign in with Google", style: textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
