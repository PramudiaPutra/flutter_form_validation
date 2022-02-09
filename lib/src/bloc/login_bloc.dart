import 'package:forms_validation/src/functions/form_validation.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends FormValidation {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  get email => _email.stream.transform(validateEmail);
  get password => _password.stream.transform(validatePassword);
  get submitLogin =>
      CombineLatestStream.combine2(email, password, (e, p) => true);

  get changeEmail => _email.sink.add;
  get changePassword => _password.sink.add;

  get emailValue => _email.value;
  get passwdValue => _password.value;

  dispose() {
    _email.close();
    _password.close();
  }
}
