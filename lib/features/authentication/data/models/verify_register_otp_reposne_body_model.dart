import 'package:clinic/features/authentication/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_register_otp_reposne_body_model.g.dart';

@JsonSerializable()
class VerifyRegisterOtpReposneBodyModel {
  final String? token;
  final String? tokenExpiration;
  final String? refreshToken;
  final String? refreshTokenExpiration;
  final User? user;
  final bool? success;
  final String? message;
  final List? errors;

  const VerifyRegisterOtpReposneBodyModel({
    this.token,
    this.tokenExpiration,
    this.refreshToken,
    this.refreshTokenExpiration,
    this.user,
    this.success,
    this.message,
    this.errors,
  });

  factory VerifyRegisterOtpReposneBodyModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VerifyRegisterOtpReposneBodyModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$VerifyRegisterOtpReposneBodyModelToJson(this);
}
