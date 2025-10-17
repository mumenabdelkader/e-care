import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dividerColor = Theme.of(context).dividerColor;

    return Row(
      children: [
        Expanded(child: Divider(color: dividerColor, thickness: 2)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Text(
            "OR",
            style: textTheme.titleLarge?.copyWith(
              color: Theme.of(context).hintColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(child: Divider(color: dividerColor, thickness: 2)),
      ],
    );
  }
}
