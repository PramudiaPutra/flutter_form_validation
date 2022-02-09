import 'package:flutter/material.dart';
import 'package:forms_validation/src/screen/login_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const LoginScreen(),
    );
  }
}
