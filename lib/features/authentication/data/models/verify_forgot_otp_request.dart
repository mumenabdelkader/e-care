import 'package:json_annotation/json_annotation.dart';
part 'verify_forgot_otp_request.g.dart';
@JsonSerializable()
class VerifyForgotOTpRequestModel {
  String? email;
  String? otpCode;

  VerifyForgotOTpRequestModel({this.email, this.otpCode});
  factory VerifyForgotOTpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyForgotOTpRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyForgotOTpRequestModelToJson(this);


}
