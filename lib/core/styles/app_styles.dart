import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static const String fontFamily = "Urbanist";

  static TextStyle font24W700 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
  );
  static TextStyle font16W400Grey = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static TextStyle font16W700Grey = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
  );

  static TextStyle font14W700White = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle font14W600 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle font12W400LightGrey = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGrey,
  );
  static TextStyle font14W700Primary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
  static TextStyle font14W400LightGrey = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGrey,
  );
  static TextStyle font14W600Primary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static TextStyle font14W400 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
}
