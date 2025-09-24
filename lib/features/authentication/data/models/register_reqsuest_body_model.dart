import 'package:json_annotation/json_annotation.dart';

part 'register_reqsuest_body_model.g.dart';

@JsonSerializable()
class RegisterReqsuestBodyModel {
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;

  RegisterReqsuestBodyModel({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
  factory RegisterReqsuestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterReqsuestBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterReqsuestBodyModelToJson(this);
}
