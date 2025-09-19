import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerifyRegisterOtpScreen extends StatelessWidget {
  const VerifyRegisterOtpScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final OtpFieldController controller = OtpFieldController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Verfiication", style: AppStyles.font24W700Black),
            VerticalSpacing(10),
            Text(
              "Go Check Your Email: $email, we will send a authentication code",
              style: AppStyles.font16W400Grey,
            ),
            VerticalSpacing(40.h),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50.w,
              controller: controller,
              style: TextStyle(fontSize: 17.sp),
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 40.r,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: AppColors.softGrey,
                focusBorderColor: AppColors.primary,
                errorBorderColor: AppColors.red,
                borderColor: AppColors.grey,
              ),
              keyboardType: TextInputType.number,
              onChanged: (pin) {
                print("Current pin: $pin");
              },
              onCompleted: (pin) {
                print("Completed: $pin");
              },
            ),
            VerticalSpacing(25.h),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Resend code in ",
                      style: AppStyles.font16W400Black,
                    ),
                    WidgetSpan(
                      child: Text("Resend", style: AppStyles.font16W700Primary),
                      alignment: PlaceholderAlignment.middle,
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpacing(70.h),
            CustomButton(
              lable: Text('Continue', style: AppStyles.font14W700White),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
