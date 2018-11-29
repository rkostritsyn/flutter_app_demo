import 'package:flutter/material.dart';
import 'package:flutter_app_demo/shop/shop_bloc.dart';

class StoreProvider extends InheritedWidget {
  final ShopBlock shopBlock = ShopBlock();

  StoreProvider({Key key, Widget child})
      : super(key: key, child: child);

  static ShopBlock of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(StoreProvider)
    as StoreProvider)
        .shopBlock;
  }

  @override
  bool updateShouldNotify(_) => true;

}