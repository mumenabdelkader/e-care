import 'package:clinic/core/constants/app_assets.dart';
import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/features/authentication/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

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
            end: Alignment.centerLeft,
            colors: [Colors.blue.shade200, Colors.white],
            stops: const [0.1, 0.9],
          ),
        ),
        child: Column(
          children: [
            Image.asset(AppAssets.appLogo, height: 70.h, width: 163.w),
            const VerticalSpacing(20),
            Image.asset(
              AppAssets.getStartedCover,
              height: 365.h,
              width: 340.w,
              fit: BoxFit.cover,
            ),
            const VerticalSpacing(20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30.h, left: 28.w, right: 28.w),
                child: Column(
                  children: [
                    Text(
                      "Improve the Quality\nof Service for Patient\nHappiness",
                      textAlign: TextAlign.center,
                      style: AppStyles.font32W700Black,
                    ),
                    VerticalSpacing(35),
                    CustomButton(
                      lable: 'Get Started',
                      onPressed: () {
                        context.pushNamed(Routes.register);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
