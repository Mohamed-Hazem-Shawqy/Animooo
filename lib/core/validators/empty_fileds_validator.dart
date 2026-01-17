abstract class EmptyFieldsValidator {
  static String? call(String? fields) {
    if (fields == null || fields.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }

}