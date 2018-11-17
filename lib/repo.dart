import 'package:flutter_app_demo/models.dart';

class Repo {
  final categoryList = [
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
    new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
  ];

  List<ShopCategoryModel> getCategoriesList() {
    return categoryList;
  }

  final productList = [
    new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast', price: "UA 220.00", isInWishList: false, imagePath: 'assets/product_preview.png'),
    new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast', price: "UA 220.00", isInWishList: false, imagePath: 'assets/product_preview.png'),
    new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast', price: "UA 220.00", isInWishList: false, imagePath: 'assets/product_preview.png'),
    new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast', price: "UA 220.00", isInWishList: false, imagePath: 'assets/product_preview.png'),
    new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast', price: "UA 220.00", isInWishList: false, imagePath: 'assets/product_preview.png'),
    new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast', price: "UA 220.00", isInWishList: false, imagePath: 'assets/product_preview.png'),
    new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast', price: "UA 220.00", isInWishList: false, imagePath: 'assets/product_preview.png'),
    new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast', price: "UA 220.00", isInWishList: false, imagePath: 'assets/product_preview.png'),
  ];

  List<ProductModel> getProductLis() {
    return productList;
  }


}
