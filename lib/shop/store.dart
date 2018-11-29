import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/bloc/app_state_providers.dart';
import 'package:flutter_app_demo/model/models.dart';
import 'package:flutter_app_demo/shop_catalog/shop_category_screen.dart';
import 'package:flutter_app_demo/styles.dart';

class Store extends StatelessWidget {
  Store(this.listType);

  final String listType;

  @override
  Widget build(BuildContext context) {
    final shopListBlock = ApplicationStateProvider.of(context);
    shopListBlock.fetchShopCategoryList();

    return new Scaffold(
    body: StreamBuilder(
        stream: shopListBlock.shopCategoryList,
        builder: (context, AsyncSnapshot<List<ShopCategoryModel>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        }
    )
    );
  }

  Widget buildList(List<ShopCategoryModel> list) =>
      ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext ctx, index) {
          return ListItemCategory(
            category: list[index],
          );
        },);
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
                MaterialPageRoute(builder: (context) => ShopCategoryScreen()),
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