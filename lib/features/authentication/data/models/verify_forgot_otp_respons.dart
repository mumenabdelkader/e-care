import 'package:json_annotation/json_annotation.dart';
part 'verify_forgot_otp_respons.g.dart';
@JsonSerializable()
class VerifyForgotOTpRespons {
  bool? success;
  String? message;
  List<String>? errors;

  VerifyForgotOTpRespons({this.success, this.message, this.errors});

  factory VerifyForgotOTpRespons.fromJson(Map<String, dynamic> json) =>
      _$VerifyForgotOTpResponsFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyForgotOTpResponsToJson(this);

}
