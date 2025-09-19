import 'package:clinic/core/routing/app_router.dart';
import 'package:clinic/core/routing/routes.dart';
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
        initialRoute: Routes.verifyRegisterOtp,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
