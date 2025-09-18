import 'package:clinic/core/constants/app_assets.dart';
import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 20.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue.shade200, Colors.blue.shade50],
          ),
        ),
        child: Column(
          children: [
            Image.asset(AppAssets.appLogo, height: 70.h, width: 163.w),
            VerticalSpacing(20),
            Padding(
              padding: EdgeInsets.only(left: 36.w),
              child: Image.asset(
                AppAssets.onboardingCover,
                height: 365.h,
                width: 340.w,
                fit: BoxFit.cover,
              ),
            ),
            VerticalSpacing(30),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30.h, left: 28.w),
                color: AppColors.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Easy Way to Get\nBetter Life",
                      textAlign: TextAlign.left,
                      style: AppStyles.font32W700White,
                    ),
                    VerticalSpacing(20),
                    Text(
                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat.",
                      textAlign: TextAlign.left,
                      style: AppStyles.font16W400White,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routes.getStarted);
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.white,
        child: Icon(Icons.arrow_forward, color: AppColors.primary),
      ),
    );
  }
}
