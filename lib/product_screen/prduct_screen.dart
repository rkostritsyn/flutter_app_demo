import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/bag/bag_bloc.dart';
import 'package:flutter_app_demo/bag/bag_provider.dart';
import 'package:flutter_app_demo/dot_indicator.dart';
import 'package:flutter_app_demo/model/models.dart';

class ProductScreen extends StatelessWidget {
  static GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ProductModel productModel;

  const ProductScreen({this.productModel});

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    final bagBloc = BagProvider.of(context);

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(productModel.name),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              child: Text(productModel.descr),
              padding: const EdgeInsets.all(20),
            ),
            new Divider(
              height: 2,
              color: Colors.black54,
            ),
            new Container(
              constraints: BoxConstraints.expand(height: 300),
              child: new PageView(
                controller: pageController,
                children: <Widget>[
                  new Image(
                      image: new AssetImage(productModel.priviewImagePath)),
                  new Image(
                      image: new AssetImage(productModel.priviewImagePath)),
                  new Image(
                      image: new AssetImage(productModel.priviewImagePath)),
                ],
              ),
            ),
            new DotIndicator(controller: pageController),
            new Container(
              constraints: BoxConstraints.expand(height: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(productModel.formatedPrice),
            ),

            new Container(
              constraints: BoxConstraints.expand(height: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Size: Please select'),
            ),

            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizeContainer(size: 'S'),
                      SizeContainer(size: 'M'),
                      SizeContainer(size: 'L'),
                      SizeContainer(size: 'XL'),
                      SizeContainer(size: 'XXL')
                    ],
                  ),
                )),

            new Divider(
              height: 2,
              color: Colors.black54,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:  new RaisedButton(onPressed: () => _addToBagAction(productModel, bagBloc),
                color: Colors.red,
                child: Container(
                constraints: const BoxConstraints.expand(height: 45),
                child: Center( child: Text('ADD TO BAG', style: TextStyle(color: Colors.white),),)
                 ),),
            )

          ],
        ),
      ),
    );
  }

  void _addToBagAction(ProductModel product, BagBloc bagBloc) {
    showSnackBar('This item has been added to your bag');
    bagBloc.cartAddition.add(CartAddition(product));
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

class SizeContainer extends StatelessWidget {
  final String size;

  const SizeContainer({this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: new DecoratedBox(
          child: new Container(
            constraints: BoxConstraints.expand(width: 90, height: 50),
            child: Center(
              child: Text(size),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3),
          ),
        ));
  }
}

class DotIndicator extends StatelessWidget {
  final PageController controller;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  const DotIndicator({this.controller});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(15),
      child: new DotsIndicator(
        controller: controller,
        itemCount: 3,
        onPageSelected: (int page) {
          controller.animateToPage(
            page,
            duration: _kDuration,
            curve: _kCurve,
          );
        },
      ),
    );
  }
}
