// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_respond_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRespondModel _$ResetPasswordRespondModelFromJson(
  Map<String, dynamic> json,
) => ResetPasswordRespondModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ResetPasswordRespondModelToJson(
  ResetPasswordRespondModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
