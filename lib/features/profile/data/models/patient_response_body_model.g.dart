// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_response_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientResponseBodyModel _$PatientResponseBodyModelFromJson(
  Map<String, dynamic> json,
) => PatientResponseBodyModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  errors: json['errors'] as List<dynamic>?,
);

Map<String, dynamic> _$PatientResponseBodyModelToJson(
  PatientResponseBodyModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
