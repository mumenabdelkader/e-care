import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/utils/di.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileInfo(),
            VerticalSpacing(24),
            Text("General", style: AppStyles.font16W700Grey),

            _profileSection(
              title: "Account Information",
              subtitle: "Change your account information",
              icon: Icon(Icons.person, color: AppColors.primary, size: 25.sp),
              onTap: () {
                context.pushNamed(Routes.accountInformation);
              },
            ),
            Divider(),

            _profileSection(
              title: "Insurance Detail",
              subtitle: "Add your insurance info",
              icon: Icon(Icons.payment, color: AppColors.green, size: 25.sp),
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
                    return ElevatedButton(
                      onPressed:
                          state is AuthLoading
                              ? null
                              : () {
                                context.read<AuthCubit>().logout();
                              },
                      child: Text("Logout", style: AppStyles.font24W600Red),
                    );
                  },
                ),
              ),
            ),
          ],
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
}
