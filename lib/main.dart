
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/bag.dart';
import 'package:flutter_app_demo/home_screen.dart';
import 'package:flutter_app_demo/search.dart';
import 'package:flutter_app_demo/store.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Test',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.red,
        primaryColorDark: Colors.red,
        accentColor: Colors.red,
      ),
      home: new DashboardScreen(title: 'Home Screen'),

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
    _pageController = new PageController();
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
      appBar: new AppBar(
        actions: <Widget>[IconButton(icon: Icon(Icons.search), onPressed:() {
          showSearch(context: context, delegate: DataSearch());
        })],
        title: new Text(
          widget.title,
          style: new TextStyle(color:Colors.black),
        ),
      ),
      body: new PageView(
        children: [
          new HomeScreen("Home screen"),
          new Store("Location screen"),
          new Bag("Friends screen"),
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
                  Icons.location_on,
                  color:Colors.black54,
                ),
                title: new Text(
                  "Store",
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

}

class DataSearch extends SearchDelegate<String> {
  final brands = [
    "Zara",
    "Calvin Klein",
    "Dolce & Gabbana",
    "Giorgio Armani",
    "Dior",
    "Prada",
    "Versace",
    "Chanel"
  ];

  final popularBrands = [
    "Giorgio Armani",
    "Dior",
    "Prada"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation), onPressed: () {
      close(context, null);
    });

  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchDetail("Detail");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList =
    query.isEmpty ? popularBrands : brands.where((p) => p.startsWith(query)).toList();

    return ListView.builder(itemBuilder:
        (context, index) =>
        ListTile(
            onTap: () {
              showResults(context);
            },
            title: RichText(text: TextSpan(
                text: brands[index].substring(0, query.length),
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                children: [TextSpan(
                    text: brands[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)
                )
                ]
            ))),
        itemCount: suggestionList.length
    );
  }

}
