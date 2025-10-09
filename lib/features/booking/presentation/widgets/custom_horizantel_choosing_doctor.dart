import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHorizentelChoosingDoctor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 35  ,
        backgroundImage: NetworkImage("https://i.pravatar.cc/100"),

      ),
      title: Text("dr. Nirmala Azalea",style: AppStyles.font16W700black),
      subtitle:       Text("Orthopedic",style: AppStyles.font12W400Grey,),
      trailing: Text("\$12",style: AppStyles.font16W700black),
    );
  }

}