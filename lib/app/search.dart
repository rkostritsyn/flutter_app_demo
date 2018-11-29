import 'package:flutter/material.dart';
import 'package:flutter_app_demo/search.dart';

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
