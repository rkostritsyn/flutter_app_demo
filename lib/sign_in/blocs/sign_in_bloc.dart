import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc extends Object with Validator {

  final _emailController = BehaviorSubject<String>(); //RxDart's implementation of StreamController. Broadcast stream by default
  final _passwordController = BehaviorSubject<String>();

  final _userLoginController = PublishSubject<String>();

  Stream<String> get emailStream => _emailController.stream
      .transform(performEmailValidation); //Return the transformed stream
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(performPasswordValidation);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  Function(String) get updateEmail => _emailController.sink.add;
  Function(String) get updatePassword => _passwordController.sink.add;

  void successfulLogin() => _userLoginController.add(_emailController.value);

  ValueObservable<String> get userLogin => _userLoginController.shareValue();

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
