import 'dart:io';

import 'package:clinic/core/networking/api_constant.dart';
import 'package:clinic/features/profile/data/models/get_profile_response_body_model.dart';
import 'package:clinic/features/profile/data/models/patient_request_body_model.dart';
import 'package:clinic/features/profile/data/models/patient_response_body_model.dart';
import 'package:clinic/features/profile/data/models/photo_response_body_model.dart';
import 'package:clinic/features/profile/data/models/updata_patient_profile_request_body_model.dart';
import 'package:clinic/features/profile/data/models/updata_patient_profile_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ProfileService {
  factory ProfileService(Dio dio) = _ProfileService;

  @POST(ApiConstant.createPatientPprofileEP)
  Future<PatientResponseBodyModel> createPatientProfile({
    @Body() required PatientRequestBodyModel body,
  });

  @PUT(ApiConstant.updatePatientPprofileEP)
  Future<UpdataPatientProfileResponseModel> updatePatientPprofile({
    @Body() required UpdataPatientProfileRequestBodyModel body,
  });

  @GET(ApiConstant.getPatientPprofileEP)
  Future<GetProfileResponseBodyModel> getPatientProfile();

  @POST(ApiConstant.setPatientPprofilePhotoEP)
  Future<PhotoResponseBodyModel> setPatientPprofilePhoto({@Part(name: "photo") required File photo});

  @DELETE(ApiConstant.reomvePatientPprofilePhotoEP)
  Future<PhotoResponseBodyModel> reomvePatientPprofilePhoto();
}
