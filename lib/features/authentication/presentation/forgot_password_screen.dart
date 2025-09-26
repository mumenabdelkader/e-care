import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';

class ForgotPassowrdScreen extends StatelessWidget {
  const ForgotPassowrdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forgot Password", style: AppStyles.font24W700Black),
            VerticalSpacing(8),
            Text(
              "Select verification method and we will send verification code",
              style: AppStyles.font16W400Grey,
            ),
            VerticalSpacing(26),
            GestureDetector(
              onTap: () => context.pushNamed(Routes.resetPassword),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 72,
                decoration: BoxDecoration(
                  //rgba(237, 241, 248, 1)
                  border: Border.all(color: Color.fromRGBO(237, 241, 248, 1)),
                  borderRadius: BorderRadius.circular(8),
                  // color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.softGrey,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(Icons.email_outlined, size: 20.sp),
                    ),
                    HorizontalSpacing(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: AppStyles.font14W600Black,
                        ), //rgba(128, 141, 158, 1)
                        VerticalSpacing(4),
                        Text(
                          "********@mail.com",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(128, 141, 158, 1),
                          ),
                        ),
                      ],
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
