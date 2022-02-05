import 'package:email_validator/email_validator.dart';

class FormValidation {
  String? validateEmail(value) {
    if (EmailValidator.validate(value) != true) {
      return 'invalid email format';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value == null || value.length < 6) {
      return 'password must at least 6 chracter';
    }
    return null;
  }
}
