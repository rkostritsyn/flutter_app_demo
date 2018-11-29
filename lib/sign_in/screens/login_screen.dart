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
            loginButton(stateMgmtBloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(StateSignInBloc stateMgmtBloc) {
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

  Widget passwordField(StateSignInBloc stateMgmtBloc) {
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

  Widget loginButton(StateSignInBloc stateMgmtBloc) {
    return StreamBuilder(
      stream: stateMgmtBloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.red,
          onPressed: snapshot.hasData
              ? () => Navigator.pushNamed(context,
                  "/secondscreen") //If both email and password are valid, enable login button. Navigate to second screen when user presses the login button
              : null, //Disable the button if there is an error
        );
      },
    );
  }
}
