import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/features/profile/data/models/patient_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({super.key, required this.patientProfileData});
  final PatientProfileModel patientProfileData;

  @override
  State<AccountInformationScreen> createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  @override
  void initState() {
    // TODO: cach user data بدل profile data و call getProfile here
    super.initState();
  }

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
              onTap:
                  () => context.pushNamed(
                    Routes.editAccount,
                    arguments: widget.patientProfileData,
                  ),
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
                    children: [
                      Expanded(
                        child: InfoItem(
                          title: 'Ecare ID',
                          value: widget.patientProfileData.patientId,
                        ),
                      ),
                      Expanded(
                        child: InfoItem(
                          title: 'Username',
                          value: widget.patientProfileData.patientId,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: InfoItem(
                          title: 'First Name',
                          value: widget.patientProfileData.firstName,
                        ),
                      ),
                      Expanded(
                        child: InfoItem(
                          title: 'Last Name',
                          value: widget.patientProfileData.lastName,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: InfoItem(
                          title: 'Date of Birth',
                          value: _formattedDate(
                            widget.patientProfileData.dateOfBirth,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InfoItem(
                          title: 'Gender',
                          value: widget.patientProfileData.gender,
                        ),
                      ),
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
                    children: [
                      Expanded(
                        child: InfoItem(
                          title: 'Phone Number',
                          value: widget.patientProfileData.phoneNumber,
                        ),
                      ),
                      Expanded(
                        child: InfoItem(
                          title: 'Email',
                          value: widget.patientProfileData.email,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: InfoItem(
                          title: 'Full Name',
                          value:
                              "${widget.patientProfileData.firstName} ${widget.patientProfileData.lastName}",
                        ),
                      ),
                      Expanded(
                        child: InfoItem(
                          title: 'City',
                          value: widget.patientProfileData.city,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: InfoItem(
                          title: 'Province',
                          value: widget.patientProfileData.province,
                        ),
                      ),
                      Expanded(
                        child: InfoItem(
                          title: 'Address',
                          value: widget.patientProfileData.address,
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

  String _formattedDate(DateTime date) {
    return "${widget.patientProfileData.dateOfBirth.year}/${widget.patientProfileData.dateOfBirth.month}/${widget.patientProfileData.dateOfBirth.day}";
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
