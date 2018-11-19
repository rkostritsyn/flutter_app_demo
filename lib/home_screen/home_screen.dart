import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/model/models.dart';
import 'package:flutter_app_demo/styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.listType);
  final String listType;

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        child: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(),
            child: new Column(
              children: <Widget>[
                new WelcomeBanner(),
                new PromoBanner(bannerPath: 'assets/black_friday_banner.png'),
                new CategoryYouShopped(),
                new PromoBanner(bannerPath: 'assets/best_of.png'),
                new OffersList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      margin: const EdgeInsets.all(10),
      child: new Container(
        constraints: BoxConstraints.expand(height: 70),
        padding: EdgeInsets.all(10),
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text("Welcome", style: h1),
            new Text("Sing in or create Account")
          ],
        ),
      ),
    );
  }
}

class PromoBanner extends StatelessWidget {
  const PromoBanner({this.bannerPath});

  final String bannerPath;

  @override
  Widget build(BuildContext context) {
    var blackFridayBannerImage = new AssetImage(bannerPath);
    var banner = new Image(
      image: blackFridayBannerImage,
      fit: BoxFit.cover,
    );
    return new Container(
      child: banner
    );
  }
}

class OffersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(20),
        child: new Column(
          children: <Widget>[
            new OffersViewHeader(),
            new Divider(
              color: Colors.black26,
              height: 2,
            ),
            new OfferViewer(
              offerModel: new OfferModel(
                  offerName: "Macy's Offers",
                  offerDescription: "See current deals & promotions"),
            ),
            new Divider(
              color: Colors.black26,
              height: 2,
            ),
            new OfferViewer(
              offerModel: new OfferModel(
                  offerName: "Your Saved Offers",
                  offerDescription:
                      "See exclucive offers saved in your Wallet"),
            ),
            new Divider(
              color: Colors.black26,
              height: 2,
            ),
            new OfferViewer(
              offerModel: new OfferModel(
                  offerName: "Offer name 2", offerDescription: "Offer"),
            ),
            new Divider(
              color: Colors.black26,
              height: 2,
            ),
            new OfferViewer(
              offerModel: new OfferModel(
                  offerName: "Offer name 3", offerDescription: "Offer"),
            ),
          ],
        ),
      ),
    );
  }
}

class OffersViewHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: BoxConstraints.expand(height: 50),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container( child:  new Icon(Icons.ac_unit), margin: const EdgeInsets.only(right: 10),),
          new Text(
            "Offers",
            style: h1,
          )
        ],
      ),
    );
  }
}

class OfferViewer extends StatelessWidget {
  final OfferModel offerModel;

  const OfferViewer({this.offerModel});

  @override
  Widget build(BuildContext context) {
    return new Container(
        constraints: BoxConstraints.expand(height: 40),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(offerModel.offerName, style: h2,),
            new Text(offerModel.offerDescription)
          ],
        ));
  }
}

class CategoryYouShopped extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
        margin: const EdgeInsets.all(10),
        child: new Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              new Container(
                  child: new Text(
                "Categories Your Shopped",
                style: h1,
              )),
              new CategoryGallery(),
              new Container(
                child: new Text(
                  "VIEW ALL CATEGORIES",
                  style: TextStyle(
                      color: Colors.red[800], fontWeight: FontWeight.bold),
                ),
                margin: const EdgeInsets.only(top: 50, bottom: 20),
              )
            ],
          ),
        ));
  }
}

class CategoryGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new ShopCategoryViewer(
          category:
              new ShopCategoryModel(name: "home", imagePath: 'assets/home.png'),
        ),
        new ShopCategoryViewer(
          category:
              new ShopCategoryModel(name: "men", imagePath: 'assets/men.png'),
        ),
        new ShopCategoryViewer(
          category: new ShopCategoryModel(
              name: "beauty", imagePath: 'assets/beauty.png'),
        ),
      ],
    );
  }
}

class ShopCategoryViewer extends StatelessWidget {
  final ShopCategoryModel category;

  const ShopCategoryViewer({this.category});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          new Container(
            child: new Image(
              image: new AssetImage(category.imagePath),
              fit: BoxFit.cover,
            ),
            padding: const EdgeInsets.all(10),
            constraints: new BoxConstraints.expand(width: 100, height: 100),
          ),
          new Container(
            child: new Text(category.name),
            margin: const EdgeInsets.only(top: 3),
          )
        ],
      ),
    );
  }
}
