import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_model.g.dart';

@JsonSerializable()
class ResetPasswordResponseModel {
  bool? success;
  String? message;
  List<String>? errors;

  ResetPasswordResponseModel({this.success, this.message, this.errors});
  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordResponseModelToJson(this);
}
