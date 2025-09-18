class ApiConstant {
  static const String baseUrl =
      "http://ecareclinic.runasp.net/swagger/index.html/api/v1/";
  static const String registerEp = "Account/Register";
  static const String loginEp = "Account/Login";
  static const String verifyRegisterOtpEP = "Account/Verify-register-otp";
  static const String forgotPasswordEmailEP =
      "Account/forgot-password-by-email";
  static const String verifyPasswordRestOtpEP =
      "Account/verify-password-reset-otp";
  static const String restPasswordEP = "Account/reset-password";
  static const String generateNewTokenEp = "Account/generate-new-jwt-token";
}
