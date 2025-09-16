import 'package:flutter/cupertino.dart';

class CustomSignUpGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: Container(
        height: 48,
        width: double.infinity,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/google 1.png"),
            SizedBox(width: 15,),
            Text("Sign in with Google",style: TextStyle(fontSize:14,fontWeight: FontWeight.w600,color: Color.fromRGBO(43, 52, 83, 1)) ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Color.fromRGBO(233, 236, 242, 1)),
          borderRadius: BorderRadius.circular(7),
        ),

      ),
    );
  }

}