import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class ProductShowCase extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "SowCase",
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }

}