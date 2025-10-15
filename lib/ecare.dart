import 'package:clinic/core/routing/app_router.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/theme/app_theme.dart';
import 'package:clinic/core/theme/cubit/theme_cubit.dart';
import 'package:clinic/core/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECare extends StatelessWidget {
  const ECare({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: BlocProvider.value(
        value: getIt<ThemeCubit>(),
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themeMode,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              initialRoute: Routes.onboarding,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
