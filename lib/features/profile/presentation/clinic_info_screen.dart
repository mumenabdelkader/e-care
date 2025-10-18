import 'package:clinic/core/constants/app_assets.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClinicInfoScreen extends StatelessWidget {
  const ClinicInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clinic Information'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Image.asset(AppAssets.clinicInfoCover, fit: BoxFit.cover),
            VerticalSpacing(32),
            _infoListTile(
              'Clinic Name',
              'International ECARE Clinic',
              Icon(
                Icons.medical_services,
                color: Color(0xff8D43EC),
                size: 25.sp,
              ),
            ),
            Divider(color: Theme.of(context).dividerColor),
            _infoListTile(
              'Contact Number',
              '+1 234 567 890',
              Icon(Icons.phone, color: AppColors.yellow, size: 25.sp),
            ),
            Divider(color: Theme.of(context).dividerColor),
            _infoListTile(
              'Email Address',
              'Ecareclinic4@gmail.com',
              Icon(Icons.email_outlined, color: AppColors.green, size: 25.sp),
            ),
            Divider(color: Theme.of(context).dividerColor),
          ],
        ),
      ),
    );
  }

  Widget _infoListTile(String title, String value, Widget leadingIcon) {
    return ListTile(
      leading: leadingIcon,
      title: Text(title),
      subtitle: Text(value),
    );
  }
}
