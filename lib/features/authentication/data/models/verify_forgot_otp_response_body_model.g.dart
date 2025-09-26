// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_forgot_otp_response_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyForgotOtpResponseBodyModel _$VerifyForgotOtpResponseBodyModelFromJson(
  Map<String, dynamic> json,
) => VerifyForgotOtpResponseBodyModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$VerifyForgotOtpResponseBodyModelToJson(
  VerifyForgotOtpResponseBodyModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
