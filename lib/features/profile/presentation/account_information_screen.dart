import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/features/profile/data/models/patient_profile_model.dart';
import 'package:clinic/features/profile/presentation/controller/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({super.key, required this.patientProfileData});
  final PatientProfileModel patientProfileData;

  @override
  State<AccountInformationScreen> createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  late PatientProfileModel currentProfileData;

  @override
  void initState() {
    super.initState();
    currentProfileData = widget.patientProfileData;
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
              onTap: () async {
                // Navigate to edit screen
                await context.pushNamed(
                  Routes.editAccount,
                  arguments: currentProfileData,
                );

                // When we come back, request fresh data
                if (mounted) {
                  context.read<ProfileCubit>().getPatientProfile();
                }
              },
              child: const Icon(Icons.mode_edit_outline_outlined),
            ),
          ),
        ],
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is GetProfilePatientSuccess) {
            setState(() {
              currentProfileData = state.data.profile;
            });
          }
        },
        child: SingleChildScrollView(
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
                            value: currentProfileData.patientId,
                          ),
                        ),
                        Expanded(
                          child: InfoItem(
                            title: 'Username',
                            value: currentProfileData.userName,
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
                            value: currentProfileData.firstName,
                          ),
                        ),
                        Expanded(
                          child: InfoItem(
                            title: 'Last Name',
                            value: currentProfileData.lastName,
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
                              currentProfileData.dateOfBirth,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InfoItem(
                            title: 'Gender',
                            value: currentProfileData.gender,
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
                            value: currentProfileData.phoneNumber,
                          ),
                        ),
                        Expanded(
                          child: InfoItem(
                            title: 'Email',
                            value: currentProfileData.email,
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
                                "${currentProfileData.firstName} ${currentProfileData.lastName}",
                          ),
                        ),
                        Expanded(
                          child: InfoItem(
                            title: 'City',
                            value: currentProfileData.city,
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
                            value: currentProfileData.province,
                          ),
                        ),
                        Expanded(
                          child: InfoItem(
                            title: 'Address',
                            value: currentProfileData.address,
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
      ),
    );
  }

  String _formattedDate(DateTime date) {
    return "${currentProfileData.dateOfBirth.year}/${currentProfileData.dateOfBirth.month}/${currentProfileData.dateOfBirth.day}";
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
