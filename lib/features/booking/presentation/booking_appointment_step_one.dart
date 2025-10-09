import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/features/booking/presentation/booking_appointment_step_two.dart';
import 'package:clinic/features/booking/presentation/widgets/Custom_appoint_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingAppointmentStepOne extends StatelessWidget{
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
            Text("Step 1/5",style: AppStyles.font14W700Primary,),
            VerticalSpacing(48),
            Text("Choose Type of Doctor",style: AppStyles.font16W700black,),
            VerticalSpacing(16),

            SizedBox(
              height: 36,
              width: double.infinity,
              child: ListView.builder(itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) => GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: Container(
                        height: 36,
                        width: 103,
                        alignment: Alignment.center,
                        child: Text("General",style:AppStyles.font14W700White,),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(40)
                        ),
                      ),
                    ),
                  ),
              ),
            ),
            VerticalSpacing(48),
            Text("Appointment Time",style: AppStyles.font16W700black,),
            VerticalSpacing(16),

            SizedBox(
              height: 36,
              width: double.infinity,
              child: ListView.builder(itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) => GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Container(

                      height: 36,
                      width: 98,
                    alignment: Alignment.center,
                    decoration:   BoxDecoration(
                          color: Color.fromRGBO(248, 248, 251, 1),//rgba(248, 248, 251, 1)
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Text("Anytime",style: AppStyles.font14W600Black,),
                    ),
                  ),
                ),
              ),
            ),
            VerticalSpacing(48),

            Text("Appointment Type",style: AppStyles.font16W700black,),
            VerticalSpacing(16),
            CustomAppointType(icon: Icons.person_add_alt_rounded, type: "in person", isCecked: true),
            VerticalSpacing(16),
            CustomAppointType(icon: Icons.video_camera_back_rounded, type: "video call", isCecked: false),
            VerticalSpacing(16),
            CustomAppointType(icon: Icons.call, type: "phon", isCecked: true),
            VerticalSpacing(16),
            CustomButton(lable: Text("Continue",style: AppStyles.font14W700White,), onPressed: (){
              // context.pushNamed(Routes.bookingAppointmentStep2);
              Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentStepTwo(),));
            })

          ],
          
        ),
      ),
    );
  }

}