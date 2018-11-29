import 'package:flutter/material.dart';
import '../blocs/sign_in_bloc.dart';
import '../blocs/sign_in_provider.dart';

class SecondScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = SignInProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Container(
        margin: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            buildText(bloc),
          ],
        ),
      ),
    );
  }
}

Widget buildText(StateSignInBloc bloc) {
  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Text('You are logged in as ${snapshot.data}');
    },
  );
}
