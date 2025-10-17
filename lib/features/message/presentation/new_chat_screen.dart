import 'package:clinic/core/extension/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  String _filterValueSelected = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Message',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            _filterOptions(context),
            Divider(color: Theme.of(context).dividerColor),
            _buildContactList(context),
          ],
        ),
      ),
    );
  }

  _filterOptions(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _filterOptionItem(context, 'All'),
          _filterOptionItem(context, 'Doctors'),
          _filterOptionItem(context, 'Admins'),
        ],
      ),
    );
  }

  _filterOptionItem(BuildContext context, String option) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _filterValueSelected = option;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:
              _filterValueSelected == option
                  ? Theme.of(context).primaryColor
                  : Colors.grey[300],
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            option,
            style: TextStyle(
              color:
                  _filterValueSelected == option ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  _buildContactList(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildContactListTile(context);
        },
        separatorBuilder:
            (context, index) => Divider(color: Theme.of(context).dividerColor),
      ),
    );
  }

  _buildContactListTile(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24.w,
        backgroundImage: NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSteItzPyeDKBxyWiOA8xrPZXIlxOYv1b1VVg&s',
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contact Name', style: Theme.of(context).textTheme.titleMedium),
          VerticalSpacing(5),
          Text('Doctor', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
