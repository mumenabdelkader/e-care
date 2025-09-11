import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color.fromRGBO(233, 236, 242, 1),
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "OR",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color.fromRGBO(128, 141, 158, 1)),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color.fromRGBO(233, 236, 242, 1),
            thickness: 2,
          ),
        ),
      ],
    );
  }

}