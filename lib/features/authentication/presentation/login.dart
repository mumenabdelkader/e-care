import 'package:clinic/core/styles/fonts.dart';
import 'package:clinic/features/authentication/presentation/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_divider.dart';
import 'widgets/custom_signup_google.dart';
import 'widgets/custom_text_form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container()),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back!", style: FontStyles.style24),
              SizedBox(height: 8),
              Text("Sign In to your account", style: FontStyles.style17),
              SizedBox(height: 25),
              CustomSignUpGoogle(),
              SizedBox(height: 17),
              CustomDivider(),
              Form(
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: emailController,
                      label: "email",
                      prefixIcon: FontAwesomeIcons.envelope,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: passwordController,
                      label: "password",
                      prefixIcon: Icons.lock_outline_sharp,
                      suffixIcon: FontAwesomeIcons.eyeSlash,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(37, 124, 255, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 42),
              CustomButton(lable: "login", onTap: () {}),
              SizedBox(height: 58),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Don't have account? ",
                    style: TextStyle(color: Color.fromRGBO(128, 141, 158, 1)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text(
                      "Sign Up ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color.fromRGBO(37, 124, 255, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
