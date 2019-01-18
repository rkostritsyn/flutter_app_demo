import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/bag/bag_provider.dart';
import 'package:flutter_app_demo/model/models.dart';
import 'package:flutter_app_demo/styles.dart';

const NO_ITEMS = 'NO ITEMS IN YOUR BAG';

class Bag extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Account"),
      ),
      body: BagItemsList(),
    );
  }
}

class BagItemsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bagBloc = BagProvider.of(context);
    return StreamBuilder<List<BagItemModel>>(
        stream: bagBloc.items,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return _noItemsLabel();
            } else {
              return _buildBagContent(snapshot.data);
            }
          }
        }
    );
  }

  Widget  _buildBagContent(List<BagItemModel> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => BagItemViewer(item: data[index]));
  }

  Widget _noItemsLabel() {
    return Center (
      child: Text(NO_ITEMS) ,
    );
  }
}

class BagItemViewer extends StatelessWidget {
  final BagItemModel item;

  BagItemViewer({this.item });

  @override
  Widget build(BuildContext context) {

    return new Container(
        constraints: new BoxConstraints.expand(height: 150),
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              new Card(
                margin: cardInnerMargin,
                child: new Container(
                  margin: cardInnerMargin,
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          image: new DecorationImage(
                            image: new ExactAssetImage('assets/beauty.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                          border: new Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      new Text(item.product.name),
                      new Container(
                        decoration: new BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: Colors.grey,
                            width: 10,
                          ),
                        ),
                        child: new Center(
                          child: new Text(item.count.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CheckoutBtn()
            ]
        )
    );
  }
}

class SizeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class CheckoutBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bagBloc = BagProvider.of(context);

    return new RaisedButton(
      padding: const EdgeInsets.all(8.0),
      textColor: Colors.white,
      color: Colors.red,
      onPressed: () => bagBloc.callPayPal(),
      child: new Text("CHECKOUT"),
    );
  }

}