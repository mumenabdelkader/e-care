import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  String _filterValue = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: [
          _actionContainer(
            context,
            iconData: Icons.add,
            onTap: () {
              context.pushNamed(Routes.newChat);
            },
          ),
          _actionContainer(
            context,
            iconData: Icons.notifications_none_outlined,
            onTap: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [_buildSearchBar(context), _buildMessageList(context)],
        ),
      ),
    );
  }

  Widget _actionContainer(
    BuildContext context, {
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          size: 24.w,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: TextField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintText: 'Search messages',
                prefixIcon: Icon(Icons.search),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(
                  context,
                ).scaffoldBackgroundColor.withOpacity(0.1),
              ),
            ),
          ),
          _actionContainer(
            context,
            iconData: Icons.filter_alt_outlined,
            onTap: () {
              _filterBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildMessageListTile(context);
        },
        separatorBuilder:
            (context, index) => Divider(
              thickness: 1,
              indent: 16.w,
              endIndent: 16.w,
              color: Theme.of(context).dividerColor,
            ),
      ),
    );
  }

  Widget _buildMessageListTile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.chat);
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.w,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSteItzPyeDKBxyWiOA8xrPZXIlxOYv1b1VVg&s',
            ),
          ),
          HorizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                VerticalSpacing(4),
                Text('Doctor', style: Theme.of(context).textTheme.bodySmall),
                VerticalSpacing(4),
                Text(
                  'Last message preview goes here...',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text('2:45 PM', style: Theme.of(context).textTheme.bodySmall),
              VerticalSpacing(8),
              Container(
                width: 20.w,
                height: 20.h,
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5.r),
                  shape: BoxShape.rectangle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ),
            ],
          ),
          HorizontalSpacing(16),
        ],
      ),
    );
  }

  void _filterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Theme.of(sheetContext).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Filter',
                  style: Theme.of(sheetContext).textTheme.titleLarge,
                ),
              ),
              Text(
                'Select Filter Options',
                style: Theme.of(sheetContext).textTheme.bodyMedium,
              ),
              VerticalSpacing(16),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                value: 'All',
                groupValue: _filterValue,
                onChanged: (value) {
                  setState(() {
                    _filterValue = value!;
                  });
                  sheetContext.pop();
                },
                title: Text(
                  'All',
                  style: Theme.of(sheetContext).textTheme.titleMedium,
                ),
              ),
              VerticalSpacing(8),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                value: 'Doctors',
                groupValue: _filterValue,
                onChanged: (value) {
                  setState(() {
                    _filterValue = value!;
                  });
                  sheetContext.pop();
                },
                title: Text(
                  'Doctors',
                  style: Theme.of(sheetContext).textTheme.titleMedium,
                ),
              ),
              VerticalSpacing(8),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                value: 'Admins',
                groupValue: _filterValue,
                onChanged: (value) {
                  setState(() {
                    _filterValue = value!;
                  });
                  sheetContext.pop();
                },
                title: Text(
                  'Admins',
                  style: Theme.of(sheetContext).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
