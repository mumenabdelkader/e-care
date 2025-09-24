import 'package:clinic/core/utils/cache_helper.dart';
import 'package:clinic/core/utils/di.dart';
import 'package:clinic/ecare.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setupDependencyInjection();
  runApp(const ECare());
}

// 401 Expiered or wrong
// 403 wrong role
