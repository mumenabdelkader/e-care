import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        //rgba(126, 140, 160, 1) rgba(126, 140, 160, 1)
        prefixIcon: Icon(
          prefixIcon,
          size: 25,
          color: Color.fromRGBO(126, 140, 160, 1),
        ),
        label: Text(
          "Type your $label",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(126, 140, 160, 1),
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(126, 140, 160, 1)),
        ),
        suffixIcon:
            suffixIcon != null
                ? Icon(suffixIcon, color: Color.fromRGBO(126, 140, 160, 1))
                : null,
      ),
    );
  }
}
