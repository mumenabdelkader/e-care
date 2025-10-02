import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account Information", style: AppStyles.font20W700Black),
        actions: [
          Container(
            width: 42.w,
            height: 42.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.softGrey,
            ),
            child: GestureDetector(
              onTap: () => context.pushNamed(Routes.editAccount),
              child: const Icon(Icons.mode_edit_outline_outlined),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Personal", style: AppStyles.font16W700Grey),
            VerticalSpacing(20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.softGrey,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: InfoItem(title: 'Ecare ID', value: '1092302'),
                      ),
                      Expanded(
                        child: InfoItem(title: 'Username', value: 'zhafira'),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: const [
                      Expanded(
                        child: InfoItem(title: 'First Name', value: 'zhafira'),
                      ),
                      Expanded(
                        child: InfoItem(title: 'Last Name', value: 'Azalea'),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: const [
                      Expanded(
                        child: InfoItem(
                          title: 'Date of Birth',
                          value: 'Feb 12, 1994',
                        ),
                      ),
                      Expanded(child: InfoItem(title: 'Gender', value: 'Male')),
                    ],
                  ),
                ],
              ),
            ),
            VerticalSpacing(30),
            Text("Contact", style: AppStyles.font16W700Grey),
            VerticalSpacing(20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.softGrey,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: InfoItem(
                          title: 'Phone Number',
                          value: '081892319321',
                        ),
                      ),
                      Expanded(
                        child: InfoItem(
                          title: 'Email',
                          value: 'zhafira@gmail.com',
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: const [
                      Expanded(
                        child: InfoItem(title: 'Full Name', value: 'John Doe'),
                      ),
                      Expanded(
                        child: InfoItem(title: 'City', value: 'Bandung'),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: const [
                      Expanded(
                        child: InfoItem(title: 'Province', value: 'West Java'),
                      ),
                      Expanded(
                        child: InfoItem(
                          title: 'Address',
                          value: 'Jl. Sekar Wangi 20 A, Bancangan',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const InfoItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.font12W400Grey),
          VerticalSpacing(4),
          Text(value, style: AppStyles.font14W700Black),
        ],
      ),
    );
  }
}
