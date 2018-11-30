import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/bag/bag_provider.dart';
import 'package:flutter_app_demo/model/models.dart';

class Bag extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
            appBar: new AppBar(
              title: Text("Bag"),
            ),

      body: BagItemsList()
    );
  }
}

class BagItemsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bagBloc = BagProvider.of(context);
    return StreamBuilder<List<BagItemModel>>(
      stream: bagBloc.items,
      builder: (context, snapshot) =>
          ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => BagItemViewer(item: snapshot.data[index]))
    );
  }
}

class BagItemViewer extends StatelessWidget {
  final BagItemModel item;

  BagItemViewer({this.item });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 80),
      child: Card(
        child: Row(
          children: <Widget>[
            Text(item.product.name),
            Text(item.count.toString())
          ],
        ),
      )
    );
  }

}