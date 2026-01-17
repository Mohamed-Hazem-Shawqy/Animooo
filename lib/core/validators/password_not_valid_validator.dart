abstract class PasswordNotValidValidator {
  static String? call(String? password) {
    if (password == null || password.trim().isEmpty) {
      //min 6 chars, letters and numbers
      return "This field is required";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters long containing letters and numbers";
    }
    return null;
  }
}
