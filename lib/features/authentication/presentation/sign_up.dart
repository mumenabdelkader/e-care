

import 'package:clinic/features/authentication/presentation/widgets/custom_signup_google.dart';
import 'package:clinic/features/authentication/presentation/login.dart';
import 'package:clinic/core/styles/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_divider.dart';
import 'widgets/custom_text_form_field.dart';





class SignUp extends StatefulWidget{
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController=TextEditingController();

  TextEditingController passwordController=TextEditingController();

  TextEditingController nameController=TextEditingController();
  bool checkedValue=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),));

      }, icon: Icon(Icons.arrow_back_ios_new)),),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20,top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign Up",style: FontStyles.style24,),
              SizedBox(height: 8,),
              Text("Create account and enjoy all services",style: FontStyles.style17,),
              SizedBox(height: 25,),
              CustomSignUpGoogle(),
              SizedBox(height: 17,),
              CustomDivider(),
              Form(child:Column(
                children: [
                  CustomTextFormField(
                    controller: nameController,
                    label: "name",
                    prefixIcon: Icons.person_outline,
                  ),
                  SizedBox(height: 10,),
                  CustomTextFormField(
                    controller: emailController,
                    label: "email",
                    prefixIcon: FontAwesomeIcons.envelope,
                  ),
                  SizedBox(height: 10,),
                  CustomTextFormField (
                    controller: passwordController,
                    label: "password",
                    prefixIcon: Icons.lock_outline_sharp,
                    suffixIcon: FontAwesomeIcons.eyeSlash,
                  ),

                ],
              ) ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Checkbox(value: checkedValue, onChanged: (value) {
                    setState(() {
                      checkedValue=value!;
                    });
                  },activeColor: Color.fromRGBO(
                      37, 117, 250, 1.0),),
                  Expanded(child: RichText(text: TextSpan(
                      text: "I agree to the ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color.fromRGBO(128, 141, 158, 1)),
                      children: [
                        TextSpan(text: "Terms of Service ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black)),
                        TextSpan(text: "and \n",style: TextStyle(color: Color.fromRGBO(128, 141, 158, 1))),
                        TextSpan(text: "Privacy Policy",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black)),
                      ]
                  )))
                ],
              ),
              SizedBox(height: 42,),
              CustomButton(lable: "sign Up",onTap: (){},),
              SizedBox(height: 58,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" Have an account? ",style:  TextStyle(color: Color.fromRGBO(128, 141, 158, 1)),),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),));
                    },
                      child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Color.fromRGBO(37, 124, 255, 1)))),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}