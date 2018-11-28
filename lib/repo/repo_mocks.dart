import 'package:flutter_app_demo/model/models.dart';

final productList = [
  new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast',
      price: 227, isInWishList: false, priviewImagePath: 'assets/product_preview.png', imagePathList: ['assets/product_preview.png'],
  sizes: sizeTypeListUS1),
  new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast',
      price: 221, isInWishList: false, priviewImagePath: 'assets/product_preview.png', imagePathList: ['assets/product_preview.png'],
      sizes: sizeTypeListUS2),
  new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast',
      price: 222, isInWishList: false, priviewImagePath: 'assets/product_preview.png', imagePathList: ['assets/product_preview.png'],
      sizes: sizeTypeListUS3),
  new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast',
      price: 215, isInWishList: false, priviewImagePath: 'assets/product_preview.png', imagePathList: ['assets/product_preview.png'],
      sizes: sizeTypeListUS3),
  new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast',
      price: 224, isInWishList: false, priviewImagePath: 'assets/product_preview.png', imagePathList: ['assets/product_preview.png'],
      sizes: sizeTypeListUS2),
  new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast',
      price: 225, isInWishList: false, priviewImagePath: 'assets/product_preview.png', imagePathList: ['assets/product_preview.png'],
      sizes: sizeTypeListUS1),
  new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast',
      price: 226, isInWishList: false, priviewImagePath: 'assets/product_preview.png', imagePathList: ['assets/product_preview.png'],
      sizes: sizeTypeListUS1),
  new ProductModel(name: 'Calvin Kline', descr: 'Mens 3/4 Length Coast',
      price: 220, isInWishList: false, priviewImagePath: 'assets/product_preview.png', imagePathList: ['assets/product_preview.png'],
      sizes: sizeTypeListUS3),
];

final sizeTypeListUS1 = const [
  SizeModel(sizeName: 'S', isAvailable: true),
  SizeModel(sizeName: 'M', isAvailable: false),
  SizeModel(sizeName: 'L', isAvailable: true),
  SizeModel(sizeName: 'XL', isAvailable: true),
  SizeModel(sizeName: 'XXL', isAvailable: true),
  SizeModel(sizeName: 'XXXL', isAvailable: true),
];

final sizeTypeListUS2 = const [
  SizeModel(sizeName: 'S', isAvailable: true),
  SizeModel(sizeName: 'M', isAvailable: false),
  SizeModel(sizeName: 'L', isAvailable: true),
  SizeModel(sizeName: 'XL', isAvailable: false),
  SizeModel(sizeName: 'XXL', isAvailable: true),
  SizeModel(sizeName: 'XXXL', isAvailable: true),
];

final sizeTypeListUS3 = const [
  SizeModel(sizeName: 'S', isAvailable: false),
  SizeModel(sizeName: 'M', isAvailable: false),
  SizeModel(sizeName: 'L', isAvailable: false),
  SizeModel(sizeName: 'XL', isAvailable: false),
  SizeModel(sizeName: 'XXL', isAvailable: true),
  SizeModel(sizeName: 'XXXL', isAvailable: true),
];

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