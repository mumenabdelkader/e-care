// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_response_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponseBodyModel _$LogoutResponseBodyModelFromJson(
  Map<String, dynamic> json,
) => LogoutResponseBodyModel(
  success: json['success'] as bool,
  message: json['message'] as String?,
  errors: json['errors'] as List<dynamic>?,
);

Map<String, dynamic> _$LogoutResponseBodyModelToJson(
  LogoutResponseBodyModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
