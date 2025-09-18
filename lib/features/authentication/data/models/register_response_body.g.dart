// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseBody _$RegisterResponseBodyFromJson(
  Map<String, dynamic> json,
) => RegisterResponseBody(
  success: json['success'] as bool,
  message: json['message'] as String?,
  errors: json['errors'],
);

Map<String, dynamic> _$RegisterResponseBodyToJson(
  RegisterResponseBody instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
