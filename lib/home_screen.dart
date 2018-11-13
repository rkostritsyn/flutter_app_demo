import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/models.dart';

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
                Card(
                  child: ConstrainedBox(constraints: BoxConstraints.expand(height: 70),
                    child: new Container(
                      padding: EdgeInsets.all(10),
                      child: new Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text("Welcom", style: TextStyle(fontWeight: FontWeight.bold)),
                          new Text("Sing in or create Account")
                        ],
                      ),
                    )
                  ),
                  margin: EdgeInsets.all(20),
                ),
                new PromoBanner(bannerPath: 'assets/black_friday_banner.png'),
                new CategoryYouShopped(),
                new PromoBanner(bannerPath: 'assets/best_of.png',),
                new OffersList()
              ],
            ),
          ),
          
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
    var banner = new Image(image: blackFridayBannerImage, fit: BoxFit.cover,);
    return new Container(child: banner);
  }
}

class OffersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(20),
          child: new Column(children: <Widget>[
            new OffersViewHeader(),
            new Divider(color: Colors.black26, height: 2,),
            new OfferViewer(offerModel: new OfferModel(offerName: "Offer name 0", offerDescription: "Offer"),),
            new Divider(color: Colors.black26, height: 2,),
            new OfferViewer(offerModel: new OfferModel(offerName: "Offer name 1", offerDescription: "Offer"),),
            new Divider(color: Colors.black26, height: 2,),
            new OfferViewer(offerModel: new OfferModel(offerName: "Offer name 2", offerDescription: "Offer"),),
            new Divider(color: Colors.black26, height: 2,),
            new OfferViewer(offerModel: new OfferModel(offerName: "Offer name 3", offerDescription: "Offer"),),
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
      constraints: BoxConstraints.expand(height: 30),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[new Icon(Icons.ac_unit), new Text("Offers")],),);
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
          new Text(offerModel.offerName),
          new Text(offerModel.offerDescription)
        ],
      )
    );
  }
}

class CategoryYouShopped extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      margin: const EdgeInsets.all(10),
      child: Column(


      ),
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
          new Image(image: new AssetImage(''),  fit: BoxFit.cover,),

        ],
      ),
    ) ;
  }}
