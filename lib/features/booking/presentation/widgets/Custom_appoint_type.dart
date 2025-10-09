import 'package:clinic/core/extension/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppointType extends StatelessWidget{
  String type;
  bool isCecked;
  IconData icon;
  CustomAppointType({ required this.icon,required this.type,required this.isCecked});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: Icon(icon,color: Colors.white,size: 24,),

          backgroundColor: Colors.green,

        ),
        HorizontalSpacing(10),
        Text("$type"),
        HorizontalSpacing(150),
       Switch(
         // activeColor: Colors.blue,
         activeTrackColor: Colors.blue,
         value: true, onChanged: (value) => !value,)
      ],
    );
  }

}