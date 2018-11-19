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
  final String priviewImagePath;
  final bool isInWishList;
  final String price;
  final List<String> imagePathList;
  final List<String> sizes = const ['12', '13', '14', '16', '17'];

  const ProductModel({this.name, this.descr, this.priviewImagePath, this.isInWishList, this.price, this.imagePathList});
}
