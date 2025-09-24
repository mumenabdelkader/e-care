import 'package:json_annotation/json_annotation.dart';
part 'reset_password_respond_model.g.dart';
@JsonSerializable()
class ResetPasswordRespondModel {
  bool? success;
  String? message;
  List<String>? errors;

  ResetPasswordRespondModel({this.success, this.message, this.errors});
  factory ResetPasswordRespondModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRespondModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordRespondModelToJson(this);

}
