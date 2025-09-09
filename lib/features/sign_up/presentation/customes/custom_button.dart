import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 48,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text("Sign Up",style: TextStyle(fontSize:14,fontWeight: FontWeight.w700,color: Color.fromRGBO(255, 255, 255, 1)) ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(37, 124, 255, 1),//rgba(37, 124, 255, 1)
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }

}