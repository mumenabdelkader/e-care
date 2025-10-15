import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/features/authentication/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_divider.dart';
import 'widgets/custom_signup_google.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.w, top: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(60),
              Text("Welcome Back!", style: textTheme.displayLarge),
              VerticalSpacing(8),
              Text("Sign In to your account", style: textTheme.bodyLarge),
              VerticalSpacing(25),
              CustomSignUpGoogle(),
              VerticalSpacing(17),
              CustomDivider(),
              LoginForm(),
              VerticalSpacing(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.forgotPassword);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: AppStyles.font14W700Primary,
                    ),
                  ),
                ],
              ),
              VerticalSpacing(58),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: " Don't have account? ",
                        style: textTheme.bodyMedium,
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.register);
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
