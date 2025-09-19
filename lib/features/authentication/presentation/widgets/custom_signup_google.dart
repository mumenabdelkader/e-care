import 'package:clinic/core/constants/app_assets.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUpGoogle extends StatelessWidget {
  const CustomSignUpGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 48.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: AppColors.softGrey),
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.googleLogo),
            const HorizontalSpacing(15),
            Text("Sign in with Google", style: AppStyles.font14W600Black),
          ],
        ),
      ),
    );
  }
}
