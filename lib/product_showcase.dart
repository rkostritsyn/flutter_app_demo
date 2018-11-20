import 'package:flutter/material.dart';
import 'package:flutter_app_demo/model/models.dart';
import 'package:flutter_app_demo/prduct_screen.dart';
import 'package:flutter_app_demo/repo/repo.dart';
import 'package:flutter_app_demo/repo/repo_mocks.dart';
import 'package:flutter_app_demo/styles.dart';

class ProductShowCase extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: PreferredSize(
              child: new Column(
                children: <Widget>[
                  TabBar(
                    tabs: [
                      Tab(
                        text: "ALL ITEMS",
                      ),
                      Tab(text: "FREE PICK UP"),
                    ],
                  ),
                  Container(
                      constraints: BoxConstraints.expand(height: 48),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Container(
                            child: new PopupMenuButton(
                              child: Text('SORT BY',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              itemBuilder: (_) => <PopupMenuItem<String>>[
                                new PopupMenuItem<String>(
                                    child: new Text('Low Price'), value: 'Sorted by low price'),
                                new PopupMenuItem<String>(
                                    child: new Text('Hige Price'), value: 'Sorted by hige price'),
                                new PopupMenuItem<String>(
                                    child: new Text('Popular'), value: 'Sorted by hige popular'),
                              ],
                              onSelected: (String value) => showSnackBar(value),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                          ),

                          GestureDetector(
                            onTap: () => showSnackBar('Filters option is available in a paid version'),
                            child: Text(
                              'FILTER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          )
                        ],
                      ))
                ],
              ),
              preferredSize: Size.fromHeight(88)),
          title: Text('Persistent Tab Demo'),
        ),
        body: TabBarView(
          children: [
            AllItems(),
            FreePickUp(),
          ],
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}

class AllItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var products = productList; //new Repo().getProductLis();

    return new Scaffold(
      body: new Container(
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return ProductPreviewItem(
                productPreview: products[index],
              );
            }),
      ),
    );
  }
}

class ProductPreviewItem extends StatelessWidget {
  final ProductModel productPreview;

  const ProductPreviewItem({this.productPreview});

  @override
  Widget build(BuildContext context) {
    var categoryAsset = new AssetImage(productPreview.priviewImagePath);
    return Container(
        child: new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductScreen(
                          productModel: productPreview,
                        )),
              );
            },
            child: new Column(
              children: <Widget>[
                Container(
                  child: Image(image: categoryAsset),
                  constraints: BoxConstraints.expand(height: 150),
                ),
                new Container(
                  child: Text(productPreview.price),
                ),
                new Text(
                  productPreview.name,
                  style: h1,
                ),
                new Text(productPreview.descr)
              ],
            )));
  }
}

class FreePickUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'NO FREE PICK UP ITEM',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
