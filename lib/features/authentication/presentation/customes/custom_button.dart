import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget{
  String lable;
  GestureTapCallback onTap;
  CustomButton({required this.lable,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text("$lable",style: TextStyle(fontSize:14,fontWeight: FontWeight.w700,color: Color.fromRGBO(255, 255, 255, 1)) ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(37, 124, 255, 1),//rgba(37, 124, 255, 1)
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }

}