import 'package:flutter/material.dart';
import 'package:flutter_app_demo/sign_in/screens/login_screen.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Account"),
      ),
      body:
         Column(
          children: <Widget>[
            UserWidget(),
          ],
        ),
      );

  }
}

class UserWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => NonSignInState();
}

class NonSignInState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        constraints: BoxConstraints.expand(height: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Hi there!'),
              new RaisedButton(onPressed: () => _signIn(context),
                color: Colors.red,
                child: Container(
                    constraints: const BoxConstraints.expand(height: 45),
                    child: Center(child: Text(
                      'SIGN IN OR CREATE ACCOUNT',
                      style: TextStyle(color: Colors.white),),)
                ),),
            ],
          ));
  }

  void _signIn(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

}
