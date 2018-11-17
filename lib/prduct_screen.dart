import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/models.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel productModel;

  const ProductScreen({this.productModel});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              productModel.name,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }

}