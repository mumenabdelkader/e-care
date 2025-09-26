import 'package:json_annotation/json_annotation.dart';

part 'login_reqsuest_body_model.g.dart';

@JsonSerializable()
class LoginReqsuestBodyModel {
  final String email;
  final String password;

  const LoginReqsuestBodyModel({required this.email, required this.password});

  factory LoginReqsuestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$LoginReqsuestBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginReqsuestBodyModelToJson(this);
}
