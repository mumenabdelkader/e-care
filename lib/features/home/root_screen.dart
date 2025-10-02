import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/utils/di.dart';
import 'package:clinic/features/home/home_screen.dart';
import 'package:clinic/features/profile/presentation/controller/profile_cubit.dart';
import 'package:clinic/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;
  final List<Widget> _bodyScreens = [
    HomeScreen(),
    Placeholder(),
    SizedBox.shrink(),
    Placeholder(),
    BlocProvider.value(value: getIt<ProfileCubit>(), child: ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyScreens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        iconSize: 25.sp,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(label: '', icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.schedule_outlined),
          ),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.chat_outlined)),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
        ],
      ),
      floatingActionButton: Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, color: AppColors.white, size: 25.sp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
