import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/features/authentication/presentation/widgets/custom_signup_google.dart';
import 'package:clinic/features/authentication/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_divider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.w, top: 70.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign Up", style: textTheme.displayLarge),
              VerticalSpacing(8),
              Text(
                "Create account and enjoy all services",
                style: textTheme.bodyLarge,
              ),
              VerticalSpacing(25),
              CustomSignUpGoogle(),
              VerticalSpacing(17),
              CustomDivider(),
              RegisterForm(),
              VerticalSpacing(15),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: " Have an account? ",
                        style: textTheme.bodyMedium,
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.login);
                          },
                          child: Text(
                            "Sign In",
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
