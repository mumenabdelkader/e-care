import 'package:json_annotation/json_annotation.dart';
part 'login_respons_body_model.g.dart';

@JsonSerializable()
class LoginResponseBodyModel {
  String? token;
  String? tokenExpiration;
  String? refreshToken;
  String? refreshTokenExpiration;
  User? user;
  bool? success;
  String? message;
  String? errors;

  LoginResponseBodyModel(
      {this.token,
        this.tokenExpiration,
        this.refreshToken,
        this.refreshTokenExpiration,
        this.user,
        this.success,
        this.message,
        this.errors});
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
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}