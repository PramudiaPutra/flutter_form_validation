import 'dart:async';

class LoginBloc {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  get email => _email.stream;
  get password => _password.stream;

  get changeEmail => _email.sink.add;
  get changePassword => _password.sink.add;
}
