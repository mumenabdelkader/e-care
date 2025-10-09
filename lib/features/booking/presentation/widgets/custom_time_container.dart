import 'package:flutter/cupertino.dart';

import '../../../../core/styles/app_styles.dart';

class CustomTimeContainer extends StatelessWidget{
  String time;
  bool isSelected;
  CustomTimeContainer({required this.time,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 36,
      width: 98,
      alignment: Alignment.center,
      decoration:   BoxDecoration(
          color: (isSelected)?Color.fromRGBO(37, 124, 255, 1):Color.fromRGBO(248, 248, 251, 1),//rgba(248, 248, 251, 1)
          border:Border.fromBorderSide(BorderSide(color: (isSelected)?Color.fromRGBO(37, 124, 255, 1):Color.fromRGBO(229, 231, 235, 1))), //rgba(229, 231, 235, 1) rgba(37, 124, 255, 1)

          borderRadius: BorderRadius.circular(40)
      ),
      child: Text("$time",style:(isSelected)?AppStyles.font14W700White: AppStyles.font14W600Black,),
    );
  }

}