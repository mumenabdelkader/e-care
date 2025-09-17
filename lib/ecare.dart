import 'package:clinic/features/authentication/presentation/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECare extends StatelessWidget {
  const ECare({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: AppTheme.lightTheme,
        home: Login(),
      ),
    );
  }
}
