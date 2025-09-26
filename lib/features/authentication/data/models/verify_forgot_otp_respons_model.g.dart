// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_forgot_otp_respons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyForgotOTpRespons _$VerifyForgotOTpResponsFromJson(
  Map<String, dynamic> json,
) => VerifyForgotOTpRespons(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$VerifyForgotOTpResponsToJson(
  VerifyForgotOTpRespons instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
