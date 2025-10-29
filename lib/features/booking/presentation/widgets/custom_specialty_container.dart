import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/app_styles.dart';

class CustomSpecialtyContainer extends StatelessWidget{
  String name;
  int specialtyId;
  bool isSelected;
  int index;
  CustomSpecialtyContainer({required this.specialtyId,required this.name,required this.isSelected,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 103,
      alignment: Alignment.center,
      child: Text((index==0)?"General":"$name",style:isSelected?AppStyles.font14W700White:AppStyles.font14W600Black,),
      decoration: BoxDecoration(
          color:isSelected? Colors.blue:Color.fromRGBO(248, 248, 251, 1),//rgba(248, 248, 251, 1)
          borderRadius: BorderRadius.circular(40)
      ),
    );
  }

}