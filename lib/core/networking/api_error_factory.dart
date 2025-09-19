import 'package:clinic/core/networking/api_error_model.dart';
import 'package:clinic/core/networking/local_status_codes.dart';
import 'package:flutter/material.dart';

class ApiErrorFactory {
  static ApiErrorModel get defaultError => ApiErrorModel(
    message: "Something went wrong",
    icon: Icons.error,
    statusCode: LocalStatusCodes.defaultError,
    errors: ["Error occurred!"],
  );
}
