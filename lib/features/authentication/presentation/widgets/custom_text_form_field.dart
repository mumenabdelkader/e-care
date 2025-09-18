import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, size: 25.sp, color: AppColors.softGrey),
        label: Text(label, style: AppStyles.font12W400LightGrey),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.softGrey),
        ),
        suffixIcon:
            suffixIcon != null
                ? Icon(suffixIcon, color: AppColors.softGrey)
                : null,
      ),
    );
  }
}
