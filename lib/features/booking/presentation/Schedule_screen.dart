import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchedulScreen extends StatelessWidget {
  const SchedulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Screen'),
      ),
      body: Center(
        child: Text('This is the Schedule Screen'),
      ),
    );
  }
}