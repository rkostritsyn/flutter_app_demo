import 'package:flutter_app_demo/model/models.dart';
import 'package:flutter_app_demo/repo/repo_mocks.dart';

abstract class Repo {

  Future<List<ShopCategoryModel>> getCategoriesList();

  Future<List<ProductModel>> getProductLis();

}

class RepoImpl implements Repo {
  var _sleepTime = Duration(seconds: 3);

  @override
  Future<List<ShopCategoryModel>> getCategoriesList() async {
    return Future.delayed(_sleepTime, () => categoryList);
  }

  @override
  Future<List<ProductModel>> getProductLis() async {
    return Future.delayed(_sleepTime, () => productList);
  }

}

