import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.black,
    TextStyle textStyle = const TextStyle(color: Colors.white),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: textStyle),
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
