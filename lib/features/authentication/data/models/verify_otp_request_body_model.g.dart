// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpRequestBodyModel _$VerifyOtpRequestBodyModelFromJson(
  Map<String, dynamic> json,
) => VerifyOtpRequestBodyModel(
  email: json['email'] as String,
  otpCode: json['otpCode'] as String,
);

Map<String, dynamic> _$VerifyOtpRequestBodyModelToJson(
  VerifyOtpRequestBodyModel instance,
) => <String, dynamic>{'email': instance.email, 'otpCode': instance.otpCode};
