import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/features/authentication/presentation/login_screen.dart';
import 'package:clinic/features/authentication/presentation/widgets/custom_signup_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_divider.dart';
import 'widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.w, top: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign Up", style: AppStyles.font24W700Black),
              VerticalSpacing(8),
              Text(
                "Create account and enjoy all services",
                style: AppStyles.font16W400Grey,
              ),
              VerticalSpacing(25),
              CustomSignUpGoogle(),
              VerticalSpacing(17),
              CustomDivider(),
              Form(
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: nameController,
                      label: "name",
                      prefixIcon: Icons.person_outline,
                    ),
                    VerticalSpacing(10),
                    CustomTextFormField(
                      controller: emailController,
                      label: "email",
                      prefixIcon: FontAwesomeIcons.envelope,
                    ),
                    VerticalSpacing(10),
                    CustomTextFormField(
                      controller: passwordController,
                      label: "password",
                      prefixIcon: Icons.lock_outline_sharp,
                      suffixIcon: FontAwesomeIcons.eyeSlash,
                    ),
                  ],
                ),
              ),
              VerticalSpacing(16),
              Row(
                children: [
                  Checkbox(
                    value: checkedValue,
                    onChanged: (value) {
                      setState(() {
                        checkedValue = value!;
                      });
                    },
                    activeColor: Color.fromRGBO(37, 117, 250, 1.0),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "I agree to the ",
                        style: AppStyles.font14W600Black,
                        children: [
                          TextSpan(
                            text: "Terms of Service ",
                            style: AppStyles.font14W400Black,
                          ),
                          TextSpan(
                            text: "and \n",
                            style: TextStyle(color: AppColors.lightGrey),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: AppStyles.font14W400Black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSpacing(42),
              CustomButton(lable: "sign Up", onTap: () {}),
              VerticalSpacing(58),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: " Have an account? ",
                        style: AppStyles.font14W400Black,
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            context.pop();
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
