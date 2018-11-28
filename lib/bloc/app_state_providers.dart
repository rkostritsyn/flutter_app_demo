import 'package:flutter/material.dart';
import 'package:flutter_app_demo/shop/shop_bloc.dart';

class ApplicationStateProvider extends InheritedWidget {
  final ShopBlock shopBlock = ShopBlock();

  ApplicationStateProvider({Key key, Widget child})
      : super(key: key, child: child);

  static ShopBlock of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ApplicationStateProvider)
    as ApplicationStateProvider)
        .shopBlock;
  }

  @override
  bool updateShouldNotify(_) => true;

}