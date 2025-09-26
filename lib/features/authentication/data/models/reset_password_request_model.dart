import 'package:json_annotation/json_annotation.dart';
part 'reset_password_request_model.g.dart';
@JsonSerializable()
class ResetPasswordRequestModel {
  String? email;
  String? newPassword;
  String? confirmPassword;

  ResetPasswordRequestModel(
      {this.email, this.newPassword, this.confirmPassword});


  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordRequestModelToJson(this);
}
