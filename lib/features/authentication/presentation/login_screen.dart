import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/utils/validation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import 'widgets/custom_divider.dart';
import 'widgets/custom_signup_google.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container()),
      body: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.w, top: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back!", style: AppStyles.font24W700Black),
              VerticalSpacing(8),
              Text("Sign In to your account", style: AppStyles.font16W400Grey),
              VerticalSpacing(25),
              CustomSignUpGoogle(),
              VerticalSpacing(17),
              CustomDivider(),
              Form(
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: emailController,
                      label: "email",
                      prefixIcon: Icons.email_outlined,
                      validator: (String? value) {
                        return ValidationUtils.getEmailValidationMessage(value);
                      },
                    ),
                    VerticalSpacing(10),
                    CustomTextFormField(
                      controller: passwordController,
                      label: "password",
                      prefixIcon: Icons.lock_outline_sharp,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.grey,
                        ),
                      ),
                      validator: (String? value) {
                        return ValidationUtils.getEmailValidationMessage(value);
                      },
                    ),
                  ],
                ),
              ),
              VerticalSpacing(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?", style: AppStyles.font14W700Primary),
                ],
              ),
              VerticalSpacing(42),
              CustomButton(
                lable: Text("Log In", style: AppStyles.font14W700White),
                onPressed: () {},
              ),
              VerticalSpacing(58),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: " Don't have account? ",
                        style: AppStyles.font14W400Black,
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Text(
                            "Sign Up ",
                            style: AppStyles.font14W600Primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
