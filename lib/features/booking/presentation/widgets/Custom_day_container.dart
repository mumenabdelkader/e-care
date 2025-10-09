import 'package:flutter/cupertino.dart';

import '../../../../core/styles/app_styles.dart';

class CustomDayContainer extends StatelessWidget{
  String dayName;
  int  dayNumber;
  bool isSelected;
  CustomDayContainer({required this.dayName,required this.dayNumber,required this.isSelected});
  @override
  Widget build(BuildContext context) {
   return Container(
     height: 63,
     width: 46,
     alignment: Alignment.center,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Text("$dayName",style:(isSelected)?AppStyles.font14W700White:AppStyles.font12W400Grey,),
         Text("$dayNumber",style:(isSelected)?AppStyles.font14W700White:AppStyles.font14W600Black,),
       ],
     ),
     decoration: BoxDecoration(
       color:(isSelected)?Color.fromRGBO(37, 124, 255, 1): Color.fromRGBO(248, 248, 251, 1),//rgba(248, 248, 251, 1)
         border:Border.fromBorderSide(BorderSide(color: (isSelected)?Color.fromRGBO(37, 124, 255, 1):Color.fromRGBO(229, 231, 235, 1))), //rgba(229, 231, 235, 1)
         borderRadius: BorderRadius.circular(40)
     ),
   );
  }

}