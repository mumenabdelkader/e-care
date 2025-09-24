// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_forgot_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyForgotOTpRequestModel _$VerifyForgotOTpRequestModelFromJson(
  Map<String, dynamic> json,
) => VerifyForgotOTpRequestModel(
  email: json['email'] as String?,
  otpCode: json['otpCode'] as String?,
);

Map<String, dynamic> _$VerifyForgotOTpRequestModelToJson(
  VerifyForgotOTpRequestModel instance,
) => <String, dynamic>{'email': instance.email, 'otpCode': instance.otpCode};
