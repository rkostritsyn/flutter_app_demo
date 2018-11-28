import 'package:flutter/material.dart';
import 'package:flutter_app_demo/model/models.dart';
import 'package:flutter_app_demo/prduct_screen.dart';
import 'package:flutter_app_demo/shop_catalog/shop_category_bloc.dart';

import 'package:flutter_app_demo/styles.dart';

final GlobalKey<ScaffoldState> appBarKey = new GlobalKey<ScaffoldState>();

class ShopCategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ShopCategoryProvider(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
                child: new Column(
                  children: <Widget>[
                    ShopTabBar(key: appBarKey),
                    ShopCategoryTabBar()
                  ],
                ),
                preferredSize: Size.fromHeight(88)),
            title: Text('Persistent Tab Demo'),
          ),
          body: ShopCategoryContent()
        ),
      )
    );
  }
}

class ShopTabBar extends StatefulWidget {
  const ShopTabBar({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitTabState();

}

class InitTabState extends State {

  var allItemsName = 'ALL ITEMS';
  var freePickUpName = 'FREE PICK UP';

  updateCounter(int allItemsCounter, int freePickUpCounter) {
    setState(() {
      this.allItemsName = allItemsName + allItemsCounter.toString();
      this.freePickUpName  = freePickUpName + freePickUpCounter.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          text: allItemsName,
        ),
        Tab(text: freePickUpName),
      ],
    );
  }

}

class ShopCategoryTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(height: 48),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Container(
              child: SortTypeMenu(),
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
            GestureDetector(
                onTap: () => {},
                child: Text(
                  'FILTER',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
            )
          ],
        ));
  }
}

class SortTypeMenu extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => PopupMenuState();
}


enum SortType { low_price, height_price, popular }

class PopupMenuState extends State<SortTypeMenu> {

  void _selectSortType(SortType type) {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (SortType v) => _selectSortType,
      child: Text('SORT BY',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      itemBuilder: (_) =>
      <PopupMenuItem<SortType>>[
        PopupMenuItem<SortType>(
          child: Text('Low Price'), value: SortType.low_price,),
        PopupMenuItem<SortType>(
            child: Text('Hige Price'), value: SortType.height_price),
        PopupMenuItem<SortType>(
            child: Text('Popular'), value: SortType.popular),
      ],
    );
  }

}


class AllItems extends StatelessWidget {
  final List<ProductModel> fetchedProductList;

  const AllItems({this.fetchedProductList});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: GridView.builder(
            itemCount: fetchedProductList.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return ProductPreviewItem(
                productPreview: fetchedProductList[index],
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
  final List<ProductModel> fetchedProductList;

  FreePickUp({this.fetchedProductList});

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

class ShopCategoryContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final shopCategoryBlock = ShopCategoryProvider.of(context);
    shopCategoryBlock.fetchProductList(111111111111111111);

    return StreamBuilder(
        stream: shopCategoryBlock.allProductList,
        builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            return TabBarView(
              children: [
                AllItems(fetchedProductList: snapshot.data),
                FreePickUp(fetchedProductList: snapshot.data),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        }
    );
  }

}