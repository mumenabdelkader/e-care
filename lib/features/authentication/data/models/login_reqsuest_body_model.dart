import 'package:json_annotation/json_annotation.dart';
part 'login_reqsuest_body_model.g.dart';
@JsonSerializable()
class LoginReqsuestBodyModel {
  String? email;
  String? password;

  LoginReqsuestBodyModel({this.email, this.password});


}