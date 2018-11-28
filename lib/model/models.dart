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
  final int price;
  final List<String> imagePathList;
  final List<SizeModel> sizes;
  final bool isFreePickUp = true;

  const ProductModel({
    this.name,
    this.descr,
    this.priviewImagePath,
    this.isInWishList,
    this.price,
    this.imagePathList,
    this.sizes
  });

  get formatedPrice => "\$ " + price.toString();
}

class SizeModel {
  final String sizeName;
  final bool isAvailable;

  const SizeModel({this.sizeName, this.isAvailable});
}


// TODO: stub model
class BagItemModel {
  final ProductModel product;
  final int count;

  const BagItemModel({this.product, this.count});


  @override
  String toString() => "${product.name} ✕ $count";
}