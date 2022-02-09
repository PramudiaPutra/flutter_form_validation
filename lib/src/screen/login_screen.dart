import 'package:flutter/material.dart';
import 'package:forms_validation/src/bloc/login_bloc.dart';
import 'package:forms_validation/src/bloc/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          const SizedBox(height: 12),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'usename@email.com',
            errorText: snapshot.error?.toString(),
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            errorText: snapshot.error?.toString(),
          ),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget submitButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitLogin,
      builder: (context, snapshot) {
        return ElevatedButton(
          child: const Text('Submit'),
          onPressed: snapshot.hasData
              ? () {
                  final snackBar = SnackBar(
                    content: Text(
                        'email: ${bloc.emailValue}\npasswd: ${bloc.passwdValue}'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              : null,
        );
      },
    );
  }
}
