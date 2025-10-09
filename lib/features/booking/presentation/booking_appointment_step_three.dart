import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/features/booking/presentation/booking_appointment_step_two.dart';
import 'package:clinic/features/booking/presentation/widgets/Custom_appoint_type.dart';
import 'package:clinic/features/booking/presentation/widgets/Custom_day_container.dart';
import 'package:clinic/features/booking/presentation/widgets/custom_time_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingAppointmentStepthree extends StatefulWidget{
  int isSelectedTimeMorning=-1;
  int isSelectedTimeNight=-1;
  int isSelectedDay=-1;

  @override
  State<BookingAppointmentStepthree> createState() => _BookingAppointmentStepthreeState();
}

class _BookingAppointmentStepthreeState extends State<BookingAppointmentStepthree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios_new,size: 24,)),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Booking Appointment",style: AppStyles.font24W700Black,),
            Text("Step 3/5",style: AppStyles.font14W700Primary,),
            VerticalSpacing(48),
            Text("Select Schedule",style: AppStyles.font16W700black,),
            VerticalSpacing(16),

            SizedBox(
              height: 63,
              width: double.infinity,
              child: ListView.builder(itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) => GestureDetector(
                  onTap: () {
                    widget.isSelectedDay=index;
                    setState(() {

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: CustomDayContainer(dayName: "m",dayNumber: 8,isSelected: (index==widget.isSelectedDay),),
                  ),
                ),
              ),
            ),
            VerticalSpacing(48),
            Text("Morning",style: AppStyles.font12W400Grey,),
            VerticalSpacing(16),

            SizedBox(
              height: 36,
              width: double.infinity,
              child: ListView.builder(itemCount: 9,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) => GestureDetector(
                  onTap: () {
                    widget.isSelectedTimeMorning=index;
                    widget.isSelectedTimeNight=-1;
                    setState(() {

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: CustomTimeContainer(time: "8.00 AM",isSelected: (widget.isSelectedTimeMorning==index),)
                  ),
                ),
              ),
            ),
            VerticalSpacing(48),
            Text("Night",style: AppStyles.font12W400Grey,),
            VerticalSpacing(16),

            SizedBox(
              height: 36,
              width: double.infinity,
              child: ListView.builder(itemCount: 9,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) => GestureDetector(
                        onTap: () {
                        widget.isSelectedTimeMorning=-1;
                        widget.isSelectedTimeNight=index;
                        setState(() {

                        });}  ,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: CustomTimeContainer(time: "7.00 PM",isSelected: (widget.isSelectedTimeNight==index),)
                  ),
                ),
              ),
            ),

          ],

        ),
      ),
    );
  }
}