import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHorizentelChoosingDoctor extends StatelessWidget{
  String name;
  String specialty;
  String price;
  CustomHorizentelChoosingDoctor({required this.name,required this.price,required this.specialty});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 35  ,
        backgroundImage: NetworkImage("https://i.pravatar.cc/100"),

      ),
      title: Text("$name",style: AppStyles.font16W700black),
      subtitle:       Text("$specialty",style: AppStyles.font12W400Grey,),
      trailing: Text("\$$price",style: AppStyles.font16W700black),
    );
  }

}