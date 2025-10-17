import 'dart:convert';

import 'package:clinic/core/constants/cache_constants.dart';
import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/utils/cache_helper.dart';
import 'package:clinic/core/utils/di.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:clinic/features/profile/data/models/patient_profile_model.dart';
import 'package:clinic/features/profile/presentation/controller/profile_cubit.dart';
import 'package:clinic/features/profile/presentation/widgets/profile_info.dart';
import 'package:clinic/features/profile/presentation/widgets/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with RouteAware {
  PatientProfileModel? patientData;
  String imageKey = DateTime.now().millisecondsSinceEpoch.toString();

  @override
  void initState() {
    super.initState();
    _getProfileData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _getProfileData();
  }

  Future<void> _getProfileData() async {
    final cachedData = CacheHelper.getString(key: CacheConstants.profileData);

    if (cachedData != null) {
      final jsonData = jsonDecode(cachedData);
      setState(() {
        patientData = PatientProfileModel.fromJson(jsonData);
        imageKey = DateTime.now().millisecondsSinceEpoch.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final surfaceColor = Theme.of(context).colorScheme.surface;
    final hintColor = Theme.of(context).hintColor;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: textTheme.displayLarge),
        actions: [
          Container(
            width: 42.w,
            height: 42.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: surfaceColor,
            ),

            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is GetProfilePatientSuccess) {
            setState(() {
              patientData = state.data.profile;
              imageKey = DateTime.now().millisecondsSinceEpoch.toString();
            });
          }
        },
        child:
            patientData == null
                ? Center(child: CircularProgressIndicator())
                : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileInfo(
                        imageKey: imageKey,
                        patientData: patientData!,
                      ),
                      VerticalSpacing(24),

                      Text(
                        "General",
                        style: textTheme.titleLarge?.copyWith(color: hintColor),
                      ),
                      ProfileSection(
                        title: "Account Information",
                        subtitle: "Change your account information",
                        icon: Icon(
                          Icons.person,
                          color: AppColors.primary,
                          size: 25.sp,
                        ),
                        onTap: () async {
                          await context.pushNamed(
                            Routes.accountInformation,
                            arguments: patientData,
                          );
                          if (mounted) {
                            _getProfileData();
                          }
                        },
                      ),
                      Divider(color: Theme.of(context).dividerColor),
                      ProfileSection(
                        title: "Insurance Detail",
                        subtitle: "Add your insurance info",
                        icon: Icon(
                          Icons.payment,
                          color: AppColors.green,
                          size: 25.sp,
                        ),
                        onTap: () {
                          context.pushNamed(Routes.insuranceDetails);
                        },
                      ),
                      Divider(color: Theme.of(context).dividerColor),
                      ProfileSection(
                        title: "Medical Records",
                        subtitle: "History about you medical records",
                        icon: Icon(
                          Icons.medication,
                          color: AppColors.yellow,
                          size: 25.sp,
                        ),
                        onTap: () {},
                      ),
                      Divider(color: Theme.of(context).dividerColor),
                      ProfileSection(
                        title: "Clinic Info",
                        subtitle: "Information about our Clinic",
                        icon: Icon(
                          Icons.medical_services,
                          color: Color(0xff8D43EC),
                          size: 25.sp,
                        ),
                        onTap: () {},
                      ),
                      Divider(color: Theme.of(context).dividerColor),
                      ProfileSection(
                        title: "Settings",
                        subtitle: "Manage & Settings",
                        icon: Icon(
                          Icons.settings,

                          color: hintColor,
                          size: 25.sp,
                        ),
                        onTap: () {
                          context.pushNamed(Routes.settings);
                        },
                      ),
                      Divider(color: Theme.of(context).dividerColor),
                      Align(
                        child: BlocProvider.value(
                          value: getIt<AuthCubit>(),
                          child: BlocListener<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is AuthFailure) {
                                showErrorDialog(context, state.errorModel);
                              }
                              if (state is AuthLogoutSuccess) {
                                context.showSnackBar(
                                  state.data.message ?? 'Logout Successfuly',
                                  backgroundColor: AppColors.green,
                                );
                                context.pushAndRemoveUntil(
                                  Routes.login,
                                  predicate: (route) => false,
                                );
                              }
                            },
                            child: SizedBox.shrink(),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            _confrimLogout(context);
                          },
                          child: Text("Logout", style: AppStyles.font24W700Red),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }

  _confrimLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Logout",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                VerticalSpacing(10),
                Text(
                  "Are you sure you want to logout?",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                VerticalSpacing(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                      },
                      child: Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    BlocProvider.value(
                      value: getIt<AuthCubit>(),
                      child: BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed:
                                state is AuthLoading
                                    ? null
                                    : () {
                                      Navigator.of(dialogContext).pop();
                                      context.read<AuthCubit>().logout();
                                    },
                            child:
                                state is AuthLoading
                                    ? SizedBox(
                                      width: 16.w,
                                      height: 16.h,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                    : Text(
                                      "Logout",
                                      style: AppStyles.font24W700Red,
                                    ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
