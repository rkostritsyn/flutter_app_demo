import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.listType);
  final String listType;

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        child: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(),
            child: new Column(
              children: <Widget>[
                Card(
                  child: ConstrainedBox(constraints: BoxConstraints.expand(height: 70),
                    child: new Container(
                      padding: EdgeInsets.all(10),
                      child: new Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text("Welcom", style: TextStyle(fontWeight: FontWeight.bold)),
                          new Text("Sing in or create Account")
                        ],
                      ),
                    )
                  ),
                  margin: EdgeInsets.all(10),
                )

              ],
            ),
          ),
          
        ),
      ),
    );
  }
}