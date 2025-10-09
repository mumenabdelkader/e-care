import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRadioInBottomSheet extends StatelessWidget{
  String type;
  int groupValue;
  bool value;
  CustomRadioInBottomSheet({required this.value,required this.type,required this.groupValue});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(value: value, groupValue: groupValue, onChanged: (value){}),
        Text("$type")
      ],
    );
  }

}