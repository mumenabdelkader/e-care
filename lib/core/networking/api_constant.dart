class ApiConstant {
  static const String baseUrl = "http://ecareclinic.runasp.net/api/v1/";

  //! Auth
  static const String registerEp = "Account/Register";
  static const String loginEp = "Account/Login";
  static const String verifyRegisterOtpEP = "Account/Verify-register-otp";
  static const String forgotPasswordEmailEP =
      "Account/forgot-password-by-email";
  static const String verifyPasswordRestOtpEP =
      "Account/verify-password-reset-otp";
  static const String restPasswordEP = "Account/reset-password";
  static const String generateNewTokenEp = "Account/generate-new-jwt-token";

  //! PatientPprofile
  static const String createPatientPprofileEP =
      "Profile/create-patient-profile";
  static const String setPatientPprofilePhotoEP =
      "/Profile/set-patient-profile-photo";
  static const String reomvePatientPprofilePhotoEP =
      "/Profile/remove-patient-profile-photo";
  static const String updatePatientPprofileEP =
      "/Profile/update-patient-profile";
  static const String getPatientPprofileEP = "/Profile/me";
}
