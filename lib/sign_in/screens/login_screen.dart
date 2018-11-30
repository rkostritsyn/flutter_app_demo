import 'package:flutter/material.dart';
import '../blocs/sign_in_bloc.dart';
import '../blocs/sign_in_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(context) {
    final stateMgmtBloc = SignInProvider
        .of(context); //Get access to the bloc in the Provider
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            emailField(stateMgmtBloc),
            SizedBox(
              height: 10.0,
            ),
            passwordField(stateMgmtBloc),
            SizedBox(
              height: 40.0,
            ),
            Container(
              constraints: const BoxConstraints.expand(height: 45),
              child:
              loginButton(stateMgmtBloc, context),
            )

          ],
        ),
      ),
    );
  }

  Widget emailField(SignInBloc stateMgmtBloc) {
    return StreamBuilder(
      stream: stateMgmtBloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //Anytime the builder sees new data in the emailStream, it will re-render the TextField widget
        return TextField(
          onChanged: stateMgmtBloc
              .updateEmail, //Wire up TextField widget to the email stream and add the email to the stream sink
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'email@xyz.com',
            labelText: 'Email Address',
            errorText: snapshot
                .error, //retrieve the error message from the stream and display it
          ),
        );
      },
    );
  }

  Widget passwordField(SignInBloc stateMgmtBloc) {
    return StreamBuilder(
      stream: stateMgmtBloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return TextField(
          onChanged: stateMgmtBloc.updatePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Enter Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget loginButton(SignInBloc stateMgmtBloc, BuildContext context) {
    return StreamBuilder(
      stream: stateMgmtBloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return RaisedButton(
          child: Text('LOGIN',
              style: TextStyle(color: Colors.white)),
          color: Colors.red,
          onPressed: () => login(snapshot, context)
        );
      },
    );
  }

  void login(AsyncSnapshot<dynamic> snapshot, BuildContext context) {
    final signInBloc = SignInProvider.of(context);
    signInBloc.successfulLogin();
    Navigator.pop(context, []);
  }

}
