
import 'dart:async';

import 'package:flutter_app_demo/bag/bag_service.dart';
import 'package:flutter_app_demo/bloc/base_bloc.dart';
import 'package:flutter_app_demo/model/models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

class CartAddition {
  final ProductModel product;
  final int count;
  CartAddition(this.product, [this.count = 1]);
}

class BagBloc extends BaseBloc {
  final _bag = BagService();

  final _bagItems = BehaviorSubject<List<BagItemModel>>(seedValue: []);
  final _itemCounter = BehaviorSubject<int>(seedValue: 0);
  final _bagAdditionController = StreamController<CartAddition>();

  BagBloc() {
    _bagAdditionController.stream.listen(_handleAdd);
  }

  Sink<CartAddition> get cartAddition => _bagAdditionController.sink;

  ValueObservable<int> get itemCounter => _itemCounter.shareValue(seedValue: 0);
  ValueObservable<List<BagItemModel>> get items => _bagItems.stream;

  void _handleAdd(CartAddition addition) {
    _bag.add(addition.product, addition.count);
    _bagItems.add(_bag.items);
    _itemCounter.add(_bag.itemCount);
  }

  void callPayPal() async {
    const url = 'https://www.paypal.com/uk/signin';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    super.dispose();
    _bagItems.close();
    _itemCounter.close();
    _bagAdditionController.close();
  }

}