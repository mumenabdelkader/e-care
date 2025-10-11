class ApiConstant {
  static const String baseUrl = "http://ecareclinic.runasp.net/api/v1/";

  //! Auth
  static const String registerEp = "Account/Register";
  static const String loginEp = "Account/Login";
  static const String logoutEp = "Account/logout";
  static const String verifyRegisterOtpEP = "Account/Verify-register-otp";
  static const String forgotPasswordEmailEP =
      "Account/forgot-password-by-email";
  static const String verifyPasswordRestOtpEP =
      "Account/verify-password-reset-otp";
  static const String restPasswordEP = "Account/reset-password";
  static const String generateNewTokenEp = "Account/generate-new-jwt-token";

  //! PatientPprofile
  static const String createPatientProfileEP = "Profile/create-patient-profile";
  static const String getPatientProfilePhotoEP =
      "/Profile/get-patient-profile-photo";
  static const String setPatientProfilePhotoEP =
      "/Profile/set-patient-profile-photo";
  static const String reomvePatientProfilePhotoEP =
      "/Profile/remove-patient-profile-photo";
  static const String updatePatientProfileEP =
      "/Profile/update-patient-profile";

  static const String getSpecialties =
      "Booking/GetSpecialties";
  static const String getPatientPprofileEP = "/Profile/me";
  static const String getAvailableDoctorsEP= "Booking/get-available-doctors?GeneralDoctorTypes={GeneralDoctorTypes}&SpecialtyId={SpecialtyId}&AppointmentTime={AppointmentTime}&InPerson={InPerson}&VideoCall={VideoCall}";


  static const String getPatientProfileEP = "/Profile/me";

}
