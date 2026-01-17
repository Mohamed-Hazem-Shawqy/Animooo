abstract class PasswordValidator {
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z\d]).{6,}$',
  );

  static String? call(String? password) {
    if (password == null || password.trim().isEmpty) {
      return "This field is required";
    } else if (!_passwordRegExp.hasMatch(password)) {
      return "Invalid password format";
    }
    return null;
  }
}
