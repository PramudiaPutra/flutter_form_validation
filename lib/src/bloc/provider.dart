import 'package:flutter/material.dart';
import 'package:forms_validation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  final bloc = LoginBloc();

  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }
}
