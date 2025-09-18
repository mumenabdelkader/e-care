import 'package:json_annotation/json_annotation.dart';

part 'register_reqsuest_body.g.dart';

@JsonSerializable()
class RegisterReqsuestBody {
  final String userName;
  final String email;
  final String password;

  RegisterReqsuestBody({
    required this.userName,
    required this.email,
    required this.password,
  });
  factory RegisterReqsuestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterReqsuestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterReqsuestBodyToJson(this);
}
