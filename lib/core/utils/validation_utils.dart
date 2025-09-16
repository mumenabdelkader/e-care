class ValidationUtils {
  static bool isValidEmail(String email) => RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(email.trim());

  static bool isValidBasicPassword(String password) => RegExp(
    r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$",
  ).hasMatch(password);

  static bool isValidName(String name) =>
      RegExp(r"^[a-zA-Z\s\-']+$").hasMatch(name.trim()) &&
      name.trim().length >= 2;

  static String? getEmailValidationMessage(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    if (!isValidEmail(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? getBasicPasswordValidationMessage(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (!isValidBasicPassword(password)) {
      return 'Password must be at least 8 characters with: 1 uppercase, 1 lowercase, 1 number, and 1 special character';
    }
    return null;
  }

  static String? getNameValidationMessage(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }
    if (name.length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (!isValidName(name)) {
      return 'Name can only contain letters, spaces, hyphens, and apostrophes';
    }
    return null;
  }
}
