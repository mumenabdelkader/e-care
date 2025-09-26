import 'package:json_annotation/json_annotation.dart';

part 'login_respons_body_model.g.dart';

@JsonSerializable()
class LoginResponseBodyModel {
  final String? token;
  final String? tokenExpiration;
  final String? refreshToken;
  final String? refreshTokenExpiration;
  final User? user;
  final bool? success;
  final String? message;
  final String? errors;

  const LoginResponseBodyModel({
    this.token,
    this.tokenExpiration,
    this.refreshToken,
    this.refreshTokenExpiration,
    this.user,
    this.success,
    this.message,
    this.errors,
  });
  factory LoginResponseBodyModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseBodyModelToJson(this);
}

@JsonSerializable()
class User {
  String? id;
  String? userName;
  String? email;

  User({this.id, this.userName, this.email});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
