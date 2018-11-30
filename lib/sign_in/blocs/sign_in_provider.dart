import 'package:flutter/material.dart';
import 'sign_in_bloc.dart';

class SignInProvider extends InheritedWidget {
  final signInBloc = SignInBloc();

  //Take the LoginScreen Widget and push it to the InheritedWidget super class
  SignInProvider({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static SignInBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SignInProvider)
            as SignInProvider)
        .signInBloc;
  }
}
