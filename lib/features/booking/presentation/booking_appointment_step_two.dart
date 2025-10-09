import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/booking/presentation/booking_appointment_step_three.dart';
import 'package:clinic/features/booking/presentation/widgets/Custom_appoint_type.dart';
import 'package:clinic/features/booking/presentation/widgets/custom_horizantel_choosing_doctor.dart';
import 'package:clinic/features/booking/presentation/widgets/custom_radio_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/styles/app_styles.dart';
import '../../../core/widgets/custom_button.dart';

class BookingAppointmentStepTwo extends StatelessWidget {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(leading: IconButton(onPressed: (){
       Navigator.pop(context);
     }, icon: Icon(Icons.arrow_back_ios_new,size: 24,)),),
     body: Padding(
       padding: const EdgeInsets.all(20),
       child: CustomScrollView(
         slivers: [
           SliverToBoxAdapter(child: Text("Booking Appointment",style: AppStyles.font24W700Black,)),
           SliverToBoxAdapter(child: Text("Step 2/5",style: AppStyles.font14W700Primary,)),
           SliverToBoxAdapter(child: VerticalSpacing(48)),
           SliverToBoxAdapter(child: Text("Choose  Doctor",style: AppStyles.font16W700black,)),
           SliverToBoxAdapter(child: VerticalSpacing(16)),
           SliverToBoxAdapter(child: CustomTextFormField(controller: searchController,label: Text("Search doctor",style: AppStyles.font12W400Grey,),suffixIcon: Icon(Icons.search,color: Colors.black,) , )),
           SliverToBoxAdapter(child: VerticalSpacing(16)),
           SliverList(delegate: SliverChildBuilderDelegate(
             childCount: 10,
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
                               CustomHorizentelChoosingDoctor(),
                               VerticalSpacing(17),

                               GestureDetector(
                                 onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentStepthree(),));
                                 },
                                   child: CustomRadioInBottomSheet(value: true, type: "in person", groupValue: 1)),
                               GestureDetector(
                                   onTap: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentStepthree(),));
                                   },
                                   child: CustomRadioInBottomSheet(value: true, type: "video call", groupValue: 1)),
                               GestureDetector(
                                   onTap: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentStepthree(),));
                                   },
                                   child: CustomRadioInBottomSheet(value: true, type: "phone", groupValue: 1))
                             ],
                           )),);
                   },
                     child: CustomHorizentelChoosingDoctor()),
               ),
           )
           ),


         ],

       ),
     ),
   );
  }

}