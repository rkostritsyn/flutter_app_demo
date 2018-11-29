
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/app/search.dart';
import 'package:flutter_app_demo/app/tab_navigator.dart';
import 'package:flutter_app_demo/bag/bag_screen.dart';
import 'package:flutter_app_demo/bag/bag_provider.dart';
import 'package:flutter_app_demo/bag/cart_button.dart';
import 'package:flutter_app_demo/home_screen/home_screen.dart';
import 'package:flutter_app_demo/account/account.dart';
import 'package:flutter_app_demo/shop/store_provider.dart';
import 'package:flutter_app_demo/sign_in/blocs/sign_in_provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BagProvider(
      child: StoreProvider(child:
      SignInProvider(child:
      new MaterialApp(
        title: 'Flutter Test',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: Colors.red,
          primaryColorDark: Colors.red,
          accentColor: Colors.red,
        ),
        home: new DashboardScreen(title: 'Home Screen'),
      )
      )
      )
    );
  }
}

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardScreenState createState() => new _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        children: [
          HomeScreen("Home screen"),
          _buildShopNavigator(),
          Bag("BAG"),
          Account(),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: new Theme(

        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.white,
        ), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          items: [
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  color:Colors.black54,
                ),
                title: new Text(
                  "Home",
                  style: new TextStyle(
                    color:Colors.black54,
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.shop,
                  color:Colors.black54,
                ),
                title: new Text(
                  "Store",
                  style: new TextStyle(
                    color:Colors.black54,
                  ),
                )),
            new BottomNavigationBarItem(
                icon: shoppingBagIco(context),
                title: new Text(
                  "Shop",
                  style: new TextStyle(
                    color:Colors.black54,
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.people,
                  color:Colors.black54,
                ),
                title: new Text(
                  "Accaunt",
                  style: new TextStyle(
                    color:Colors.black54,
                  ),
                ))
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  Widget shoppingBagIco(BuildContext context) {
    final bagBloc = BagProvider.of(context);
    return Container(
      constraints: BoxConstraints.expand(height: 28),
        child:
        StreamBuilder<int>(
            stream: bagBloc.itemCounter,
            initialData: bagBloc.itemCounter.value,
            builder: (context, snapshot) => CartButton(itemCount: snapshot.data)
        ));
  }

  Widget _buildShopNavigator() {
      return TabNavigator(
        navigatorKey: key,
    );
  }

  final key =  GlobalKey<NavigatorState>();
}

