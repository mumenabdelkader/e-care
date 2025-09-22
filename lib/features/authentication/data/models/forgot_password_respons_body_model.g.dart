// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_respons_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordResponseBodyModel _$ForgotPasswordResponseBodyModelFromJson(
  Map<String, dynamic> json,
) => ForgotPasswordResponseBodyModel(
  success: json['success'] as bool,
  message: json['message'] as String?,
  errors: json['errors'] as List<dynamic>?,
);

Map<String, dynamic> _$ForgotPasswordResponseBodyModelToJson(
  ForgotPasswordResponseBodyModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
