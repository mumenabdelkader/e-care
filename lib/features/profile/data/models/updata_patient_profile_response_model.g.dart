// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updata_patient_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdataPatientProfileResponseModel _$UpdataPatientProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => UpdataPatientProfileResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String?,
  errors: json['errors'] as List<dynamic>?,
);

Map<String, dynamic> _$UpdataPatientProfileResponseModelToJson(
  UpdataPatientProfileResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
