
class EmailValidator {
 
  static String? call(String? value) {
     final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value??'');
    if (value == null || value.trim().isEmpty) {
      return 'Thsi field is required.';
    }
    else if (!emailValid) {
      return 'Please enter a valid email address.';
    }
    return null;
  }
}