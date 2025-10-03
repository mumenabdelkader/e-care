// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_response_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileResponseBodyModel _$GetProfileResponseBodyModelFromJson(
  Map<String, dynamic> json,
) => GetProfileResponseBodyModel(
  success: json['success'] as bool,
  message: json['message'],
  errors: json['errors'],
  profile: PatientProfileModel.fromJson(
    json['profile'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetProfileResponseBodyModelToJson(
  GetProfileResponseBodyModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
  'profile': instance.profile,
};
