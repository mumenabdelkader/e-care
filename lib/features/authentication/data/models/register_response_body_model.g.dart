// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseBodyModel _$RegisterResponseBodyModelFromJson(
  Map<String, dynamic> json,
) => RegisterResponseBodyModel(
  success: json['success'] as bool,
  message: json['message'] as String?,
  errors: json['errors'] as List<dynamic>?,
);

Map<String, dynamic> _$RegisterResponseBodyModelToJson(
  RegisterResponseBodyModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
