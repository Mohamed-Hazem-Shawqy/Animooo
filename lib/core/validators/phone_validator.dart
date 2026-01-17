abstract class PhoneValidator {
  static String? call(String? phone) {
    final RegExp phoneRegExp = RegExp(r'^(?:\+20|0)?1(0|1|2|5)\d{8}$');
    if (phone == null || phone.trim().isEmpty) {
      return "This field is required";
    } else if (!phoneRegExp.hasMatch(phone)) {
      return "Please enter a valid Egyptian phone number";
    }
    return null;
  }
}