import 'package:clinic/core/extension/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsuranceDetailsScreen extends StatelessWidget {
  const InsuranceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance Details'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(children: [_buildInsuranceCard()]),
    );
  }

  Widget _buildInsuranceCard() {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Zahri Azalan'),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Text(
                    'Active',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const VerticalSpacing(30),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.deepPurple,
              ),
              title: const Text('BPJS Kesehatan'),
              subtitle: const Text('Expiry Date: 12/31/2024'),
            ),
          ],
        ),
      ),
    );
  }
}
