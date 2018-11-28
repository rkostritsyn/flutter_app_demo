import 'package:flutter_app_demo/model/models.dart';
import 'package:flutter_app_demo/repo/repo_mocks.dart';


class Repository {
  var _sleepTime = Duration(seconds: 1);

  @override
  Future<List<ShopCategoryModel>> fetchShopCategoryList() async {
    return Future.delayed(_sleepTime, () => categoryList);
  }

  @override
  Future<List<ProductModel>> fetchProductCatalog(int shopCategoryId) async {
    return Future.delayed(_sleepTime, () => productList);
  }

}

