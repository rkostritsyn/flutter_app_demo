import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/models.dart';
import 'package:flutter_app_demo/product_showcase.dart';
import 'package:flutter_app_demo/repo.dart';
import 'package:flutter_app_demo/styles.dart';
import 'package:logging/logging.dart';

final Logger log = new Logger('ProductShowCase');

class Store extends StatelessWidget {

  Store(this.listType);

  final String listType;

  @override
  Widget build(BuildContext context) {
    var categories = new Repo().getCategoriesList();

    return new Scaffold(
        body: new ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext ctx, index) {
        return ListItemCategory(
          category: categories[index],
        );
      },
    ));
  }
}

class ListItemCategory extends StatelessWidget {
  final ShopCategoryModel category;

  const ListItemCategory({this.category});

  @override
  Widget build(BuildContext context) {
    var categoryAsset = new AssetImage(category.imagePath);
    var categoryImage = new Container(
      child: Image(
        image: categoryAsset,
        fit: BoxFit.cover,
      ),
      constraints: BoxConstraints.expand(width: 50, height: 50),
    );

    return new Container(
        constraints: new BoxConstraints.expand(height: 100),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductShowCase()),
              );
            },
            child: new Card(
              margin: cardOuterMargin,
              child: new Container(
                  margin: cardInnerMargin,
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[new Text(category.name), categoryImage],
                  )),
            )));
  }
}
