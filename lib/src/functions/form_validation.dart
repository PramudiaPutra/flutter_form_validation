import 'dart:async';

import 'package:email_validator/email_validator.dart';

class FormValidation {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (EmailValidator.validate(email) == true) {
        sink.add(email);
      } else {
        sink.addError('invalid email format');
      }
    },
  );
}

final validatePassword = StreamTransformer<String, String>.fromHandlers(
  handleData: (passwd, sink) {
    if (passwd.length > 6) {
      sink.add(passwd);
    } else {
      sink.addError('password must more than 6 character');
    }
  },
);
