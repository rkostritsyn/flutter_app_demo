class OfferModel {
  final String offerName;
  final String offerDescription;

  const OfferModel({this.offerName, this.offerDescription});
}

class ShopCategoryModel {
  final String name;
  final String imagePath;

  const ShopCategoryModel({this.name, this.imagePath});
}

class ProductModel {
  final String name;
  final String descr;
  final String imagePath;
  final bool isInWishList;
  final String price;

  const ProductModel({this.name, this.descr, this.imagePath, this.isInWishList, this.price});
}