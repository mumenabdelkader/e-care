import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/utils/di.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/booking/data/models/book_apointment_request_model.dart';
import 'package:clinic/features/booking/presentation/booking_appointment_step_two.dart';
import 'package:clinic/features/booking/presentation/controller/booking_cubit.dart';
import 'package:clinic/features/booking/presentation/widgets/Custom_appoint_type.dart';
import 'package:clinic/features/booking/presentation/widgets/Custom_day_container.dart';
import 'package:clinic/features/booking/presentation/widgets/custom_time_container.dart';
import 'package:clinic/features/profile/data/models/date_time_converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BookingAppointmentStepthree extends StatefulWidget{
  int isSelectedTimeMorning=-1;
  int isSelectedTimeNight=-1;
  int isSelectedDay=-1;
  String doctorId;
  DateTime date;
  String vistingType;
  BookingAppointmentStepthree({required this.date,required this.doctorId,required this.vistingType});

  @override
  State<BookingAppointmentStepthree> createState() => _BookingAppointmentStepthreeState();
}

class _BookingAppointmentStepthreeState extends State<BookingAppointmentStepthree> {
TextEditingController reasonController=TextEditingController();
DateTime timeNow=DateTime.now();
List<DateTime> nextDays = List.generate(
  28,
      (index) => DateTime.now().add(Duration(days: index)),
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios_new,size: 24,)),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocProvider(
  create: (context) => BookingCubit(getIt())..availableSlots(doctorId: widget.doctorId, date: DateTimeConverter().toJson(widget.date)),
  child: BlocBuilder<BookingCubit, BookingState>(
  builder: (context, state) {

    return SingleChildScrollView(
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
                child: ListView.builder(itemCount: 28,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) => GestureDetector(
                    onTap: () {
                      widget.isSelectedDay=index;
                      setState(() {
      
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: CustomDayContainer(
                        dayName: DateFormat('EEE').format(nextDays[index]),
                        dayNumber: int.parse(DateFormat('d').format(nextDays[index])),
                        isSelected: (index == widget.isSelectedDay),
                      ),                    ),
                  ),
                ),
              ),
              VerticalSpacing(100),
              Text("Morning",style: AppStyles.font12W400Grey,),
              VerticalSpacing(16),
      
              (state is BookingAvailableSlotsSuccess )?SizedBox(
                height: 36,
                width: double.infinity,
                child: ListView.builder(itemCount: 9,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) => GestureDetector(
                    onTap:state.availableSlots.timeSlots![index].isAvailable!? () {
                      widget.isSelectedTimeMorning=index;
                      widget.isSelectedTimeNight=-1;
                      setState(() {
      
                      });
                    }:null,
      
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: CustomTimeContainer(time: "${state.availableSlots.timeSlots![index].startTime}",isSelected: (widget.isSelectedTimeMorning==index),)
                    ),
                  ),
                ),
              ):Container(),
              VerticalSpacing(48),
              CustomTextFormField(controller: reasonController,label: Text("enter your reason"),),
              VerticalSpacing(48),
              BlocBuilder<BookingCubit, BookingState>(
                builder: (context, bookAppointState) {
                  return(state is BookingAvailableSlotsSuccess )? CustomButton(lable: Text("Continue",style: AppStyles.font14W700White,), onPressed: (){
               context.read<BookingCubit>().bookAppointment(
                   bookAppointmentRequestModel: BookApointmentRequestModel(doctorId:widget.doctorId,
                       date:DateTimeConverter().toJson(DateTime(timeNow.year,
                           timeNow.month,
                           int.parse(DateFormat('d').format(nextDays[widget.isSelectedDay])),
                           getHours(state.availableSlots.timeSlots![widget.isSelectedTimeMorning].startTime!),

                           getMinutes(state.availableSlots.timeSlots![widget.isSelectedTimeMorning].startTime!),


                       )
                       )
                       // date:DateTimeConverter().toJson(widget.date)
                   ,reasonForVisit:
                       reasonController.text
                       ,startTime:state.availableSlots.timeSlots![widget.isSelectedTimeMorning].startTime ,visitType:widget.vistingType ));
              }):Container();
                },
              )
            ],
      
          ),
    );
  },
),
),
      ),
    );
  }
//14:30:00
  int getHours(String startTime) {
    // startTime = "14:30:00"
    List<String> parts = startTime.split(':'); // ["14", "30", "00"]
    return int.parse(parts[0]); // أول جزء هو الساعة
  }

  int getMinutes(String startTime) {
    List<String> parts = startTime.split(':'); // ["14", "30", "00"]
    return int.parse(parts[1]); // ثاني جزء هو الدقائق
  }

}