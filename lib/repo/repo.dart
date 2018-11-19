import 'package:flutter_app_demo/model/models.dart';
import 'package:flutter_app_demo/repo/repo_mocks.dart';

class Repo {

  List<ShopCategoryModel> getCategoriesList() {
    return categoryList;
  }

  List<ProductModel> getProductLis() {
    return productList;
  }
  
}
