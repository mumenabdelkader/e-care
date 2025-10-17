import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 💡 قبل: AppStyles.font16W700Grey
            // 💡 الآن: Theme.of(context).textTheme.titleLarge
            Text(
              'General',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color:
                    Theme.of(context).hintColor, // لتطبيق اللون الرمادي الثانوي
              ),
            ),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return SwitchListTile(
                  // 💡 قبل: AppStyles.font14W700Black
                  // 💡 الآن: Theme.of(context).textTheme.titleMedium
                  title: Text(
                    'Dark Mode',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  value: themeCubit.isDark,
                  onChanged: (bool value) => themeCubit.toggleTheme(value),
                  activeThumbColor: AppColors.white,
                  activeTrackColor: AppColors.primary,
                );
              },
            ),
            SwitchListTile(
              // 💡 قبل: AppStyles.font14W700Black
              // 💡 الآن: Theme.of(context).textTheme.titleMedium
              title: Text(
                'Notifications',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              value: false,
              onChanged: (bool value) {},
              activeThumbColor: AppColors.white,
              activeTrackColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
