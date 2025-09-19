import 'package:clinic/core/utils/di.dart';
import 'package:clinic/ecare.dart';
import 'package:flutter/material.dart';

void main() {
  setupDependencyInjection();
  runApp(const ECare());
}
