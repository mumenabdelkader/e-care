import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: AppStyles.font32W700Black),
        actions: [
          Container(
            width: 42.w,
            height: 42.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.softGrey,
            ),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(children: [_profileInfo(), _profileServices()]),
        ),
      ),
    );
  }

  ListTile _profileSection(String title, String subtitle, Icon icon) {
    return ListTile(
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.softGrey,
        ),
        child: icon,
      ),
      title: Text(title, style: AppStyles.font14W700Black),
      subtitle: Text(subtitle, style: AppStyles.font12W400Grey),
      trailing: Icon(Icons.chevron_right_sharp),
    );
  }

  Widget _profileInfo() {
    return Container(
      height: 92.h,
      width: 335.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 60.r,
            backgroundColor: Colors.amber,
            child: Image.network(
              'https://static.vecteezy.com/system/resources/thumbnails/011/675/374/small_2x/man-avatar-image-for-profile-png.png',
              fit: BoxFit.fill,
              width: 60.w,
              height: 60.h,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Zhafira Azalea", style: AppStyles.font20W700White),
              VerticalSpacing(10),
              Text("beby@gmail.com", style: AppStyles.font14W400White),
            ],
          ),
        ],
      ),
    );
  }

  Widget _profileServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpacing(24),
        Text("General", style: AppStyles.font16W700Grey),
        _profileSection(
          "Account Information",
          "Change your account information",
          Icon(Icons.person, color: AppColors.primary, size: 25.sp),
        ),
        Divider(),
        _profileSection(
          "Insurance Detail",
          "Add your insurance info",
          Icon(Icons.payment, color: AppColors.green, size: 25.sp),
        ),
        Divider(),
        _profileSection(
          "Medical Records",
          "History about you medical records",
          Icon(Icons.medication, color: AppColors.yellow, size: 25.sp),
        ),
        Divider(),
        _profileSection(
          "Clinic Info",
          "Information about our Clinic",
          Icon(Icons.medical_services, color: Color(0xff8D43EC), size: 25.sp),
        ),
        Divider(),
        _profileSection(
          "Settings",
          "Manage & Settings",
          Icon(Icons.settings, color: AppColors.darkGrey, size: 25.sp),
        ),
      ],
    );
  }
}
