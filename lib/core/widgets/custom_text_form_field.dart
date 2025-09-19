import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText ?? false,
      validator: validator,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, size: 25.sp, color: AppColors.grey),
        label: Text(label, style: AppStyles.font12W400Grey),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.softGrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2.w),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.softGrey),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 2.w),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 2.w),
        ),
        suffixIcon:
            suffixIcon != null
                ? Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: suffixIcon,
                )
                : null,
      ),
    );
  }
}
