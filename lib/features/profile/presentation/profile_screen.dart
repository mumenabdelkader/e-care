import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
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
    // ✅ Refresh data when coming back from other screens
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
                      _profileInfo(),
                      VerticalSpacing(24),
                      Text("General", style: AppStyles.font16W700Grey),
                      _profileSection(
                        title: "Account Information",
                        subtitle: "Change your account information",
                        icon: Icon(
                          Icons.person,
                          color: AppColors.primary,
                          size: 25.sp,
                        ),
                        onTap: () async {
                          // ✅ Navigate and refresh when back
                          await context.pushNamed(
                            Routes.accountInformation,
                            arguments: patientData,
                          );
                          // ✅ Refresh data when coming back
                          if (mounted) {
                            _getProfileData();
                          }
                        },
                      ),
                      Divider(),
                      _profileSection(
                        title: "Insurance Detail",
                        subtitle: "Add your insurance info",
                        icon: Icon(
                          Icons.payment,
                          color: AppColors.green,
                          size: 25.sp,
                        ),
                      ),
                      Divider(),
                      _profileSection(
                        title: "Medical Records",
                        subtitle: "History about you medical records",
                        icon: Icon(
                          Icons.medication,
                          color: AppColors.yellow,
                          size: 25.sp,
                        ),
                      ),
                      Divider(),
                      _profileSection(
                        title: "Clinic Info",
                        subtitle: "Information about our Clinic",
                        icon: Icon(
                          Icons.medical_services,
                          color: Color(0xff8D43EC),
                          size: 25.sp,
                        ),
                      ),
                      Divider(),
                      _profileSection(
                        title: "Settings",
                        subtitle: "Manage & Settings",
                        icon: Icon(
                          Icons.settings,
                          color: AppColors.darkGrey,
                          size: 25.sp,
                        ),
                      ),
                      Divider(),
                      Align(
                        child: BlocProvider.value(
                          value: getIt<AuthCubit>(),
                          child: BlocConsumer<AuthCubit, AuthState>(
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
                            builder: (context, state) {
                              return TextButton(
                                onPressed:
                                    state is AuthLoading
                                        ? null
                                        : () {
                                          context.read<AuthCubit>().logout();
                                        },
                                child: Text(
                                  "Logout",
                                  style: AppStyles.font24W700Red,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _profileSection({
    required String title,
    required String subtitle,
    required Icon icon,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
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
      ),
    );
  }

  Widget _profileInfo() {
    final defaultImageUrl =
        "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541";
    final imageUrl =
        patientData!.photoUrl.isEmpty ? defaultImageUrl : patientData!.photoUrl;

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
          HorizontalSpacing(10),
          ClipRRect(
            borderRadius: BorderRadius.circular(70.r),
            child: CachedNetworkImage(
              key: ValueKey('$imageUrl-$imageKey'),
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: 80.w,
              height: 80.h,
              errorWidget: (context, url, error) {
                return Icon(Icons.error, color: Colors.white);
              },
              placeholder:
                  (context, url) => Container(
                    width: 80.w,
                    height: 80.h,
                    color: AppColors.softGrey,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(AppColors.white),
                      ),
                    ),
                  ),
            ),
          ),
          HorizontalSpacing(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${patientData!.firstName} ${patientData!.lastName}",
                style: AppStyles.font20W700White,
              ),
              VerticalSpacing(5),
              Text(patientData!.email, style: AppStyles.font14W400White),
            ],
          ),
        ],
      ),
    );
  }
}
