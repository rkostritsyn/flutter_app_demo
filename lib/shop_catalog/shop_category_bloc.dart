import 'package:flutter/material.dart';
import 'package:flutter_app_demo/bloc/base_bloc.dart';
import 'package:flutter_app_demo/model/models.dart';
import 'package:flutter_app_demo/repo/repo.dart';
import 'package:flutter_app_demo/shop_catalog/shop_category_filters.dart';
import 'package:rxdart/rxdart.dart';

class ShopCategoryBlock extends ShopCategoryFilters implements BaseBloc  {
  final repo = Repository();

  final _productCatalogFetcher = BehaviorSubject<List<ProductModel>>();

  Observable<List<ProductModel>> get allProductList => _productCatalogFetcher.stream.transform(performSortByPriceFromLowToHeight);
  Stream<List<ProductModel>> get freePickUpProductList => _productCatalogFetcher.stream;

  fetchProductList(int shopCategoryId) async {
    var items =  await repo.fetchProductCatalog(shopCategoryId);
    _productCatalogFetcher.sink.add(items);
  }

  void sortProductList(int sortType) {
  }

  @override
  void dispose() {
    _productCatalogFetcher.close();
  }
}

class ShopCategoryProvider extends InheritedWidget {
  final ShopCategoryBlock _shopCategoryBlock;

  ShopCategoryProvider ({
    Key key,
    ShopCategoryBlock shopCategoryBlock,
    Widget child,
  })  : _shopCategoryBlock = shopCategoryBlock ?? ShopCategoryBlock(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static ShopCategoryBlock of(BuildContext context) => (context.inheritFromWidgetOfExactType(ShopCategoryProvider) as ShopCategoryProvider)
      ._shopCategoryBlock;

}

