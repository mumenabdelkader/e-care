import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSteItzPyeDKBxyWiOA8xrPZXIlxOYv1b1VVg&s',
              ),
            ),
            HorizontalSpacing(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                VerticalSpacing(5),
                Text(
                  'Orthopedic',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment:
                        index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color:
                            index % 2 == 0
                                ? AppColors.lightBlue
                                : AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text('Message number $index'),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
                HorizontalSpacing(8),
                IconButton(
                  icon: Icon(Icons.send, color: AppColors.primary),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
