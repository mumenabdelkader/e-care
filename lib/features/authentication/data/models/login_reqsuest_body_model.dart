import 'package:json_annotation/json_annotation.dart';
part 'login_reqsuest_body_model.g.dart';
@JsonSerializable()
class LoginReqsuestBodyModel {
  String? email;
  String? password;

  LoginReqsuestBodyModel({this.email, this.password});
  /// factory.
  factory LoginReqsuestBodyModel.fromJson(Map<String, dynamic> json) => _$LoginReqsuestBodyModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LoginReqsuestBodyModelToJson(this);

}