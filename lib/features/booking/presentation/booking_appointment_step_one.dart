import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/utils/di.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/features/booking/presentation/booking_appointment_step_two.dart';
import 'package:clinic/features/booking/presentation/controller/booking_cubit.dart';
import 'package:clinic/features/booking/presentation/widgets/Custom_appoint_type.dart';
import 'package:clinic/features/booking/presentation/widgets/custom_specialty_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingAppointmentStepOne extends StatefulWidget{
  @override
  State<BookingAppointmentStepOne> createState() => _BookingAppointmentStepOneState();
}

class _BookingAppointmentStepOneState extends State<BookingAppointmentStepOne> {
  int isSelected=0;
  String selectedTime="Anytime";
  int isSpecialtyId=0;
  bool inPerson=true;
  bool videoCall=false;

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
              child: BlocProvider(
              create:      (context) => BookingCubit(getIt())..getSpecialties(),
              child:         BlocBuilder<BookingCubit, BookingState>(
              builder: (context, state) {
                return (state is BookingGetSpecialtiesSuccess)?ListView.builder(itemCount: state.specialties.length,
                              scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) => GestureDetector(
                    onTap: () {
                      isSelected=index;
                      isSpecialtyId=state.specialties[index].specialtyId!;
                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child:CustomSpecialtyContainer(
                          index: index,
                          isSelected: (index==isSelected),
                          name:state.specialties[index].name!
                          ,specialtyId: state.specialties[index].specialtyId!),

                    ),
                  ),
              ):Container();
  },
),
),
            ),
            VerticalSpacing(48),
            Text("Appointment Time",style: AppStyles.font16W700black,),
            VerticalSpacing(16),

            SizedBox(
              height: 36,
              width: double.infinity,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedTime="Anytime";
                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: Container(

                        height: 36,
                        width: 98,
                        alignment: Alignment.center,
                        decoration:   BoxDecoration(
                            color: (selectedTime=="Anytime")?Colors.blue: Color.fromRGBO(248, 248, 251, 1),//rgba(248, 248, 251, 1)
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text("Anytime",style:(selectedTime=="Anytime")?AppStyles.font14W700White: AppStyles.font14W600Black,),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedTime="Today";
                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: Container(

                        height: 36,
                        width: 98,
                        alignment: Alignment.center,
                        decoration:   BoxDecoration(
                            color: (selectedTime=="Today")?Colors.blue: Color.fromRGBO(248, 248, 251, 1),//rgba(248, 248, 251, 1)
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text("Today",style:(selectedTime=="Today")?AppStyles.font14W700White: AppStyles.font14W600Black,),
                      ),
                    ),
                  ),
                ],
              )
            ),
            VerticalSpacing(48),

            Text("Appointment Type",style: AppStyles.font16W700black,),
            VerticalSpacing(16),
            GestureDetector(
                onTap: () {
                  inPerson=!inPerson;
                  setState(() {

                  });
                },
                child: CustomAppointType(icon: Icons.person_add_alt_rounded, type: "in person", isCecked: inPerson)),
            VerticalSpacing(16),
            GestureDetector
              (onTap: () {
              videoCall=!videoCall;
              setState(() {

              });
            },
                child: CustomAppointType(icon: Icons.video_camera_back_rounded, type: "video call", isCecked: videoCall)),
            VerticalSpacing(16),
            CustomAppointType(icon: Icons.call, type: "phon", isCecked: true),
            VerticalSpacing(16),
            CustomButton(lable: Text("Continue",style: AppStyles.font14W700White,), onPressed: (){
              // context.pushNamed(Routes.bookingAppointmentStep2);
              Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentStepTwo(AppointmentTime:selectedTime ,GeneralDoctorTypes: (isSelected==0),InPerson: true,SpecialtyId:isSpecialtyId ,VideoCall: true,),));
            })

          ],

        ),
      ),
    );
  }
}