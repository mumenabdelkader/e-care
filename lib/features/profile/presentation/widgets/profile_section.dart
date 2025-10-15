import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });
  final String title, subtitle;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final surfaceColor = Theme.of(context).colorScheme.surface;

    final primaryTextColor = textTheme.titleMedium;
    final secondaryTextColor = textTheme.titleSmall;

    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            color: surfaceColor,
          ),

          child: icon,
        ),

        title: Text(title, style: primaryTextColor),

        subtitle: Text(subtitle, style: secondaryTextColor),

        trailing: Icon(Icons.chevron_right_sharp),
      ),
    );
  }
}
