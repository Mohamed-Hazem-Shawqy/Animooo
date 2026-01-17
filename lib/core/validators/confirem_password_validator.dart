abstract class ConfiremPasswordValidator {
  static String? call(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return "This field is required";
    } else if (password != confirmPassword) {
      return "Passwords do not match";
    }
    return null;
  }
}