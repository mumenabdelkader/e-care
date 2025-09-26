import 'package:json_annotation/json_annotation.dart';

part 'verify_forgot_otp_respons.g.dart';

@JsonSerializable()
class VerifyForgotOTpRespons {
  final bool? success;
  final String? message;
  final List<String>? errors;

  const VerifyForgotOTpRespons({this.success, this.message, this.errors});

  factory VerifyForgotOTpRespons.fromJson(Map<String, dynamic> json) =>
      _$VerifyForgotOTpResponsFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyForgotOTpResponsToJson(this);
}
