import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/utils/di.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/booking/presentation/booking_appointment_step_three.dart';
import 'package:clinic/features/booking/presentation/controller/booking_cubit.dart';
import 'package:clinic/features/booking/presentation/widgets/Custom_appoint_type.dart';
import 'package:clinic/features/booking/presentation/widgets/custom_horizantel_choosing_doctor.dart';
import 'package:clinic/features/booking/presentation/widgets/custom_radio_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extension/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/styles/app_styles.dart';
import '../../../core/widgets/custom_button.dart';

class BookingAppointmentStepTwo extends StatelessWidget {
  TextEditingController searchController=TextEditingController();
  bool GeneralDoctorTypes;
  int SpecialtyId;
  String AppointmentTime;
  bool InPerson;
  bool VideoCall;
  BookingAppointmentStepTwo({required this.VideoCall,required this.InPerson,required this.AppointmentTime,required this.SpecialtyId,required this.GeneralDoctorTypes});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(leading: IconButton(onPressed: (){
       Navigator.pop(context);
     }, icon: Icon(Icons.arrow_back_ios_new,size: 24,)),),
     body: Padding(
       padding: const EdgeInsets.all(20),
       child: BlocProvider(
  create: (context) => BookingCubit(getIt())..getAvailableDoctors(GeneralDoctorTypes: GeneralDoctorTypes, SpecialtyId: SpecialtyId, AppointmentTime: AppointmentTime, InPerson: InPerson, VideoCall: VideoCall),
  child: BlocBuilder<BookingCubit, BookingState>(
  builder: (context, state) {
    return CustomScrollView(
         slivers: [
           SliverToBoxAdapter(child: Text("Booking Appointment",style: AppStyles.font24W700Black,)),
           SliverToBoxAdapter(child: Text("Step 2/5",style: AppStyles.font14W700Primary,)),
           SliverToBoxAdapter(child: VerticalSpacing(48)),
           SliverToBoxAdapter(child: Text("Choose  Doctor",style: AppStyles.font16W700black,)),
           SliverToBoxAdapter(child: VerticalSpacing(16)),
           SliverToBoxAdapter(child: CustomTextFormField(controller: searchController,label: Text("Search doctor",style: AppStyles.font12W400Grey,),suffixIcon: Icon(Icons.search,color: Colors.black,) , )),
           SliverToBoxAdapter(child: VerticalSpacing(16)),
           (state is BookingGetAvailableDoctorsSuccess)?SliverList(delegate: SliverChildBuilderDelegate(
                    childCount:  state.AvailableDoctors.length ,
                        (context, index) =>
                      Padding(
                        padding: const EdgeInsets.only(top: 8,bottom: 8),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              ),
                              builder: (context) => Container(
                                height: 388,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
                                  ),
                                  child: Column(
                                    children: [
                                      VerticalSpacing(30),
                                      Text("Choose Type of Visit",style: AppStyles.font22W700Black,),
                                      VerticalSpacing(24),
                                      CustomHorizentelChoosingDoctor(
                                        name:  state.AvailableDoctors[index].fullName!,
                                        price:  "13",
                                        specialty:  state.AvailableDoctors[index].specialty!,
                                      ),
                                      VerticalSpacing(17),

                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentStepthree(doctorId:state.AvailableDoctors[index].doctorId! ,date: DateTime.now(),vistingType: "InPerson"
                                            ,),));
                                        },
                                          child: CustomRadioInBottomSheet(value: true, type: "in person", groupValue: 1)),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentStepthree(doctorId:state.AvailableDoctors[index].doctorId! ,date: DateTime.now(),vistingType: "VideoCall",),));
                                          },
                                          child: CustomRadioInBottomSheet(value: true, type: "video call", groupValue: 1)),
                                      // GestureDetector(
                                      //     onTap: () {
                                      //       Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentStepthree(doctorId:state.AvailableDoctors[index].doctorId! ,date: DateTime.now(),),));
                                      //     },
                                      //     child: CustomRadioInBottomSheet(value: true, type: "phone", groupValue: 1))
                                    ],
                                  )),);
                          },
                            child: CustomHorizentelChoosingDoctor(name: state.AvailableDoctors[index].fullName!, price: "3",specialty:state.AvailableDoctors[index].specialty!,),),
                      ),
                  )
                  ):SliverToBoxAdapter(child: Container(),)


         ],

       );
  },
),
),
     ),
   );
  }

}