// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/features/profile/data/models/patient_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.patientData,
    required this.imageKey,
  });
  final PatientProfileModel patientData;
  final String imageKey;

  @override
  Widget build(BuildContext context) {
    final defaultImageUrl =
        "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541";
    final imageUrl =
        patientData.photoUrl.isEmpty ? defaultImageUrl : patientData.photoUrl;

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
                "${patientData.firstName} ${patientData.lastName}",
                style: AppStyles.font20W700White,
              ),
              VerticalSpacing(5),
              Text(patientData.email, style: AppStyles.font14W700White),
            ],
          ),
        ],
      ),
    );
  }
}
