import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/features/booking/presentation/booking_appointment_step_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';

class CustomServiceItem extends StatelessWidget{
  String serviceType;
  IconData icon;
  CustomServiceItem({required this.icon,required this.serviceType});
  @override
  Widget build(BuildContext context) {
    return   Column(
        children: [
          GestureDetector(
            onTap: (){
              // context.pushNamed(Routes.bookingAppointmentStep1);
              Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentStepOne(),));
            },
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue.shade50,
              child: Icon(icon, color: Colors.blue, size: 28),
            ),
          ),
          const SizedBox(height: 8),
          Text("$serviceType", style: const TextStyle(fontSize: 14)),
        ],
      );
    }
  }

