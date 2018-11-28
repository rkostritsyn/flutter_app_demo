import 'package:flutter_app_demo/bloc/base_bloc.dart';
import 'package:flutter_app_demo/model/models.dart';
import 'package:flutter_app_demo/repo/repo.dart';
import 'package:rxdart/rxdart.dart';

class ShopBlock extends BaseBloc {

  final _repo = Repository();

  final _shopCategoryFetcher = PublishSubject<List<ShopCategoryModel>>();

  Observable<List<ShopCategoryModel>> get shopCategoryList => _shopCategoryFetcher.stream;

  fetchShopCategoryList() async {
    var items = await _repo.fetchShopCategoryList();
    _shopCategoryFetcher.sink.add(items);
  }

  @override
  void dispose() {
    _shopCategoryFetcher.close();
  }

}