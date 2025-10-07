// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoResponseBodyModel _$PhotoResponseBodyModelFromJson(
  Map<String, dynamic> json,
) => PhotoResponseBodyModel(
  photoUrl: json['photoUrl'] as String?,
  success: json['success'] as bool,
  message: json['message'] as String,
  errors: json['errors'] as List<dynamic>?,
);

Map<String, dynamic> _$PhotoResponseBodyModelToJson(
  PhotoResponseBodyModel instance,
) => <String, dynamic>{
  'photoUrl': instance.photoUrl,
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
