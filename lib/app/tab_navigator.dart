import 'package:flutter/material.dart';
import 'package:flutter_app_demo/shop/store_screen.dart';
import 'package:flutter_app_demo/shop_catalog/shop_category_screen.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String catalog = '/shop_catalog';
  static const String productScreen = '/shop_catalog/products_screen';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;


  Map<String, WidgetBuilder> _routerBuilders(BuildContext context) =>
      {
        TabNavigatorRoutes.root: (context) => Store(onPush: (args) => _pushCatalog(context)),
        TabNavigatorRoutes.catalog: (context) => ShopCategoryScreen(onPush: (args) {}),
      };

  void _pushCatalog(BuildContext context) {
    var builder = _routerBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => builder[TabNavigatorRoutes.productScreen](context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routerBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(

              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}